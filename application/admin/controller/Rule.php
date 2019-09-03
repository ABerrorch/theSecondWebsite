<?php
namespace app\admin\controller;
use app\common\controller\Adminbase;
use think\Db;
use think\Request;
/**
 * 后台权限管理
 * Description:
 * 这个模板的作者没有给出太清晰的文档,
 * 所以实际上是由二次开发者ABerror对这个文档进行注释的.
 * Author:
 * ABerror 2019年3月21日 13:06:04
 */
class Rule extends AdminBase{

//******************权限***********************

    /*权限列表*/
    public function rule_list(){
        $data=Db::name('auth_rule')->getTreeData('tree','id','title');
        return view("rule_list",[
            'data'=>$data,
            "title"=>"高级权限",
            "subtitle"=>"权限管理",
        ]);
    }

    /**
     * 添加权限
     * Description:
     * 实际读取到的数据样式类似
     * Array(
     *      [pid] => 159                         // 权限是以树的形式组织的,这是根节点编号
     *      [title] => hainenma                  // 权限标题
     *      [name] => Admin/Listfile/add_file    // 权限实际涉及的方法
     * )
     * 在auth_rule数据表中,大部分选项都有默认值,所以只需要添加这几项就可以了
     */
    public function add(){
        $data=input('post.'); // 获取post 的数据
        unset($data['id']);
        $result=Db::name('auth_rule')->insert($data);
        if ($result) {
            $this->success('添加成功','Admin/Rule/rule_list');
        }else{
            $this->error('添加失败');
        }
    }

    /**
     * 修改权限
     * Description:
     * 和添加类似,只需要考虑[pid]\[title]\[name]
     * 由于[pid]不需要修改,就只需要修改另外两个
     */
    public function edit(){
        $data=input('post.'); 
        $info=['title'=>$data['title'],'name'=>$data['name']];
        $result=Db::name('auth_rule')->where(["id"=>$data['id']])->update($info);
        // $result=\app\admin\model\Admin::change(["id"=>$data['id']],$info);
        if ($result) {
            $this->success('修改成功','Admin/Rule/rule_list');
        }else{
            $this->error('您没有做任何修改');
        }
    }

    /**
     * 删除权限
     * Description:
     * 删除ID为$id的权限
     * @param integer $id 删除的权限的ID
     * @throws
     */
    public function delete($id){
        $sub = Db::name('auth_rule')->where('pid',$id)->select();
        if(!empty($sub))$this->error("还有子权限没有删除！请先删除子权限！");
        $map=array('id'=>$id);
        $result=Db::name('auth_rule')->delete($map);
        if($result){
            $this->success('删除成功','Admin/Rule/rule_list');
        }else{
            $this->error('请先删除子权限');
        }
    }

    /**
     * 角色列表
     */
    public function rule_group(){
        return view("rule_group",[
            'data'=>Db::name('auth_group')->select(),
            'title'=>'高级权限',
            'subtitle'=>'角色管理',
        ]);
    }


     /**
     * 新增角色
     */
    public function add_group(){
        $data=input('post.');
        unset($data['id']);
        $result=Db::name('auth_group')->insert($data);
        if ($result) {
            $this->success('添加成功','Admin/Rule/rule_group');
        }else{
            $this->error('添加失败');
        }
    }

    /**
     * 修改角色名称
     */
    public function edit_group(){
        $data=input('post.');
        $result=Db::name('auth_group')->where(["id"=>$data['id']])->update(['title'=>$data['title']]);
        // $result=Db::name('auth_group')->editData($map,$data);
        if ($result) {
            $this->success('修改成功','Admin/Rule/rule_group');
        }else{
            $this->error('您没有做任何修改');
        }
    }

    /**
     * 删除角色
     */
    public function delete_group($id){
        if ($id==1) {
            $this->error('该分组不能被删除');
        }
        $map=array(
            'id'=>$id
            );
        $result=Db::name('auth_group')->where($map)->delete();
        if ($result) {
            $this->success('删除成功','Admin/Rule/rule_group');
        }else{
            $this->error('删除失败');
        }
    }


    /**
     * 分配权限
     */
    public function rule_distribution($id){
        if(Request::instance()->post()){
            $data=input('post.');
            $datas['rules']=implode(',', $data['rule_ids']);
            $result=Db::name('auth_group')->where(['id'=>$data['id']])->update($datas);
            // $result=Db::name('auth_group')->editData($map,$data);
            if ($result) {
                $this->success('操作成功','Admin/Rule/rule_group');
            }else{
                $this->error('操作失败_可能是因为你没有进行任何修改');
            }
        }else{
            $group_data=Db::name('auth_group')->where(array('id'=>$id))->find();
            $group_data['rules']=explode(',', $group_data['rules']);
            // 获取规则数据
            $rule_data=Db::name('auth_rule')->getTreeData('level','id','title');
            return view("rule_distribution",[
                "group_data"    =>$group_data,
                "rule_data"     =>$rule_data,
                "title"         =>"高级权限",
                "subtitle"      =>"权限分配",
            ]);
        }
    }

}
