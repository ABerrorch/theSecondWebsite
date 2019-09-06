<?php
/**
 * Created by PhpStorm.
 * User: Huan
 * Date: 2019/3/22
 * Time: 16:25
 */
namespace app\admin\controller;
use app\common\controller\Adminbase;
use think\Auth;
use think\Db;
use think\Request;
use think\Session;

class Research extends Listfile {
    protected $authority;
    protected $research_id;
    protected $catalog;
    public function _initialize(){
        parent::_initialize(); // TODO: Change the autogenerated stub
//        print_r(ROOT_PATH. 'application' . DS . 'admin' . DS . 'catalog.json');
        $this->catalog = file_get_contents(ROOT_PATH. 'application' . DS . 'admin' . DS . 'catalog.json');
        $this->catalog = json_decode($this->catalog,true);
//        print_r($this->catalog);
    }


    //-----------------------------------------------------------------------------------------------
    // 课题列表、课题管理
    //-----------------------------------------------------------------------------------------------
    public function index() {
        $name = Session::get("user.username");

        //下面的A|B是TP5的一种高级查询语法叫做快捷查询
        $data = Db::name('research')
            ->where("
            principal='$name'
            OR principal LIKE '$name,%'
            OR principal LIKE '%,$name,%'           
            OR principal LIKE '%,$name'")
            ->order('id',"DESC")
            ->paginate(10);
//            ->select();
        return view("index",[
            'title'=>'项目课题管理',
            'subtitle'=>'课题列表',
            'data'=>$data,
        ]);
    }
    public function research_dominate($research_id,$catalogPath = "0"){
        # 这里根据catalog分析一堆路径
//        print_r($catalogPath);
        str_replace("%2C",",",$catalogPath);
//        print_r($catalogPath);
        $path = explode(",",$catalogPath);
        $catalog = $this->catalog;
        $ret = DB::name("research")->where("id",$research_id)->find();
        if($ret['isPjt'])
            $catalog = $catalog['project'];
        else
            $catalog = $catalog['research'];
//        print_r($catalog);
        if($catalogPath != ""){
            foreach ($path as $i){
                assert($catalog['type'] == "DIR");
                $catalog = $catalog['container'][$i];
            }
        }
        # 执行
        return $this->execute($catalog,$research_id,$ret['isPjt'],$catalogPath);
    }

    ##############################################################################
    # 执行函数，根据得到的catalog跳转到相应的功能函数
    protected function execute($catalog,$research_id,$isPjt,$catalogPath){
//        print_r("------------------------------<br>");
//        print_r($catalog);
        assert(isset($catalog["type"]));
        assert( $catalog["type"] == "DIR");
        assert(count($catalog['container']) > 0);
        if($catalog['container']['0']['type'] == "DIR"){
            return $this->directory($catalog,$research_id,$isPjt,$catalogPath);
        } else {
            // 通过执行这个函数以计算路径相关的信息
            $this->DIR($research_id,$isPjt,$catalogPath);
        }
        assert(count($catalog['container']) == 1); # 假设如果container中元素为FUN元素，那么数量只能有一个
        switch ($catalog['container']['0']['name']){
            case "readOnlyA":return $this->readOnlyA($catalog,$research_id,$isPjt,$catalogPath);
            case "manageA":return $this->manageA($catalog,$research_id,$isPjt,$catalogPath);
            case "manageB":return $this->manageB($catalog,$research_id,$isPjt,$catalogPath);
            case "manageResearch": return $this->manageResearch($catalog,$research_id,$isPjt,$catalogPath);
            default:
                echo "<pre>";
                print_r($catalog);
                echo "\n<br>";
                echo "</pre>";
                return "ERROR 0000001";
        }
    }

    ##############################################################################
    # 路径显示部分
    protected function DIR($research_id,$isPjt,$catalogPath){
        if($catalogPath == "")$path = [];
        else $path = explode(",",$catalogPath);
//        print_r($path);
        $prePath = [];
        $catalog = $this->catalog;
        $catalog = $isPjt?$catalog['project']:$catalog['research'];

        $tmpStr = "";
        $q = 0;
        while(true){
            $newPath = [];
            for($j = 0;$j < count($catalog['container']);$j++){
                $newPath[$j] = [
                    "catalogPath" =>empty($tmpStr)? strval($j) : $tmpStr . "," . strval($j),
                    "name"=> $catalog['container'][$j]['name'],
                    "type"=> $catalog['container'][$j]['type'],
                ];
            }
            $prePath[count($prePath)] = [
                "catalogPath" =>$tmpStr,
                "name"=> $catalog['name'],
                "type"=> $catalog['type'],
                "newPath"=>$newPath,
            ];
            if($q == count($path))break;
            $tmp = $path[$q];
            $tmpStr = empty($tmpStr)? strval($tmp) : $tmpStr . "," . strval($tmp);
            $catalog = $catalog['container'][$tmp];
            $q++;
        }

//        echo "<pre>";
//        print_r($prePath);
//        echo "</pre>";


        $this->assign([
            'title'=>'项目课题管理',
            'subtitle'=>'项目课题管理',
            'research'=>Db::name("research")
                ->where("id",$research_id)
                ->find(),
        ]);
//        print("research_id = $research_id<br>");
//        print_r([
//            'title'=>'项目课题管理',
//            'subtitle'=>'项目课题管理',
//            'research'=>Db::name("research")
//                ->where("id",$research_id)
//                ->find(),
//        ]);
        $this->assign("prePath",$prePath);
        $this->assign("nowPath",$prePath[count($prePath) - 1]);
    }

    ##############################################################################
    # 只显示路径
    protected function directory($catalog,$research_id,$isPjt,$catalogPath){
        $this->DIR($research_id,$isPjt,$catalogPath);
        return view("dirOnly");
//        return $this->manageA($research_id,$isPjt,$catalogPath);
    }

    ##############################################################################
    #下面是一系列功能函数，用于执行不同的功能
    ##############################################################################

    ##############################################################################
    # 文件只读A
    public function readOnlyA($catalog,$research_id,$isPjt,$catalogPath){
        trace("readOnlyA(research_id = $research_id, isPjt = $isPjt,catalogPath = $catalogPath)");
        // 转换成JSON，然后进行模板渲染
        $cols = json_encode($this->cols);
        $res = Db::name("research")->where("id",$research_id)->find();
        $project_id = $res['project_id'];

        $pattern = $catalog['container'][0]['container']['catalogPath'];
        $pattern = explode(',',$pattern);
        switch ($pattern[0]){
            case 'research':
                $pattern[0] = $research_id;
                break;
            case 'project':
                $pattern[0] = $project_id;
                break;
            default:
                print_r($pattern);
                echo "\n<br>";
                return "ERROR 0000002";


        }
        $pattern = implode(',',$pattern);
        trace("Find pattern = ",$pattern);

        $files = Db::name("files")
            ->where("label LIKE '$pattern%'")
            ->whereOr("label = '$pattern'")
            ->field('id,filename,abstract,type,datetime,author')
            ->order('id',"DESC")
            ->select();
        $data_json = json_encode($files);
        $this->assign([
            'cols'=>$cols,
            'data_json'=>$data_json,
        ]);
        return view("readOnlyA");
    }

    ##############################################################################
    # 文件管理A
    public function manageA($catalog,$research_id,$isPjt,$catalogPath){
        trace("manageA(research_id = $research_id, isPjt = $isPjt,catalogPath = $catalogPath)");
        // 转换成JSON，然后进行模板渲染
        $cols = json_encode($this->cols);
        $files = Db::name("files")
            ->where("label LIKE '$research_id,$catalogPath%'")
            ->whereOr("label = '$research_id,$catalogPath'")
            ->field('id,filename,abstract,type,datetime,author')
            ->order('id',"DESC")
            ->select();
        $data_json = json_encode($files);
        $this->assign([
            'cols'=>$cols,
            'data_json'=>$data_json,
            'catalog'=>$catalog,
        ]);
//        echo "<pre>";
//        print_r($catalog);
//        echo "</pre>";
        return view("manageA");
    }

    ##############################################################################
    # 文件管理B
    public function manageB($catalog,$research_id,$isPjt,$catalogPath){
        trace("manageB(research_id = $research_id, isPjt = $isPjt,catalogPath = $catalogPath)");
        return $this->manageA($catalog,$research_id,$isPjt,$catalogPath);
    }

    ##############################################################################
    # 课题管理
    public function manageResearch($catalog,$research_id,$isPjt,$catalogPath){
        trace("manageResearch(research = $research_id,isPjt = $isPjt, catalogPath = $catalogPath)");
        assert($isPjt);
        $researches = Db::name("research")
            ->where("project_id",$research_id)
            ->paginate(10);
        $this->assign([
            "data"=>$researches,
        ]);
        return view("manageResearch");
    }

    public function batch_file_delete(){
        $result = parent::batch_file_delete();
        if(empty($result))$this->success("删除成功");
        else $this->error($result);
    }
}


