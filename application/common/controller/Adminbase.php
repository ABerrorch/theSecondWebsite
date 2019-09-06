<?php
namespace app\common\controller;
use app\common\controller\Base;
use think\Request;
use think\Auth;
use think\Db;
use think\Session;
/**
 * admin 基类控制器
 */
class AdminBase extends Base{ 
	/**
	 * 初始化方法
	 */
	public function _initialize(){
		parent::_initialize();
		/*
		 * 判定是否有进入网页的权限
		 */
		if(!isset(session('user')['id'])){
		    $this->error("请先登录",url('home/Index/index'));
        }

		$auth = Auth::instance();
		$request = Request::instance();
		$m=$request->module();
		$c=$request->controller();
		$a=$request->action();
		$rule_name=$m.'/'.$c.'/'.$a;

        $result=$auth->check($rule_name,session('user')['id']);
        trace("Access Request : $rule_name");
        trace("Access Request : " . ($result?"Accept":"Deny"));
        if(!$result){
            $result = $auth->check("super/super/super",session('user')['id']);
			if(!$result)
			    $this->error('您没有权限访问');
			else
			    trace("Access Request : God jurisdiction");
		}

		/*
		 * 获取服务器的状态
		 */
        $cpuRate = 100 - (int)shell_exec(" vmstat | tail -n 1 | awk '{print $15}'");
        $memTotal = (int)shell_exec("cat /proc/meminfo | egrep MemTotal | awk '{print $2}'");
        $memAvail = (int)shell_exec("cat /proc/meminfo | egrep MemAvailable | awk '{print $2}'");
        if(empty($cpuRate))$cpuRate = 100;
        if(empty($memTotal))$memTotal = 100000;
        if(empty($memAvail))$memAvail = 0;
        $memRate = (int) (100 * ($memTotal - $memAvail) / $memTotal);

        $this->assign([
            'cpuRate' => $cpuRate,
            'memRate' => $memRate,
        ]);


        /*
         * 获取用户所拥有的用户组名称
         */
        $user_id = Session::get('user.id');
        $user = Db::name('auth_group_access')
            ->alias('aga')
            ->join('__AUTH_GROUP__ ag','aga.group_id = ag.id')
            ->where('aga.uid',$user_id)
            ->field('ag.title')
            ->select();
        $User_Authority = [];

        foreach ($user as $v){
            if(!empty($v))
                $User_Authority[count($User_Authority)] = $v['title'];
        }

        # Main Navbar 中的列表
        $MainNav = [
            [   "header"=>"个人中心",
                "flag"=>"<i class='demo-psi-split-vertical-2'></i>",
                "container"=>[
                    ["name"=>"个人中心","url"=>'Admin/User/my_center'],
                ],
            ],[   "header"=>"高级权限",
                "flag"=>"<i class='demo-psi-gear-2'></i>",
                "container"=>[
                    ["name"=>"权限管理","url"=>'Admin/Rule/rule_list'],
                    ["name"=>"角色管理","url"=>'Admin/Rule/rule_group'],
                    ["name"=>"用户管理","url"=>'Admin/User/index'],
                    ["name"=>"文件管理","url"=>'Admin/Listfile/index'],
                    ["name"=>"LINK","url"=>'Admin/Link/index'],
                ],
            ],[   "header"=>"项目课题管理",
                "flag"=>"<i class='fa fa-cog'></i>",
                "container"=>[
//                    ["name"=>"项目管理","url"=>'Admin/Project/index'],
                    ["name"=>"项目课题管理","url"=>'Admin/Research/index'],
//                    ["name"=>"课题文件批量管理","url"=>'Admin/Listfile/batch_file_list_person'],
                ],
            ],
        ];


        # 判断Main Navbar 中的某些链接是否有权限，如果没有权限就删除
        for($i = count($MainNav) - 1;$i >= 0;$i--){
            for($j = count($MainNav[$i]["container"]) - 1;$j >= 0;$j--){
                $tmp = $MainNav[$i]["container"][$j]["url"];
                $result=
                    $auth->check($tmp,session('user')['id']) ||
                    $auth->check("super/super/super",session('user')['id']);
                if(!$result){
                    array_splice($MainNav[$i]["container"],$j,1);
                } else {
                    $MainNav[$i]["container"][$j]["url"] = url($tmp);
                }
            }
            if(empty($MainNav[$i]["container"])){
                array_splice($MainNav,$i,1);
            }
        }
        $this->assign([
            'User_Authority'=>$User_Authority,
            'MainNav'=>$MainNav,
        ]);
    }
}

