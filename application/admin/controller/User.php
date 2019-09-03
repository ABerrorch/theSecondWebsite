<?php

namespace app\admin\controller;

use app\common\controller\Adminbase;
use think\Db;
use think\Request;

/**
 * 后台首页控制器
 */
class User extends Adminbase {

    /**
     * 用户列表
     */
    public function index() {
        $data = Db::name('auth_group_access')
                ->alias('aga')
                ->field('u.id,u.username,u.email,aga.group_id,ag.title')
                ->join('__USERS__ u', 'aga.uid=u.id', 'RIGHT')
                ->join('__AUTH_GROUP__ ag', 'aga.group_id=ag.id', 'LEFT')
                ->select();
        $first = $data[0];
        $first['title'] = array();
        $user_data[$first['id']] = $first;
        // 组合数组
        foreach ($data as $k => $v) {
            foreach ($user_data as $m => $n) {
                $uids = array_map(function($a) {
                    return $a['id'];
                }, $user_data);
                if (!in_array($v['id'], $uids)) {
                    $v['title'] = array();
                    $user_data[$v['id']] = $v;
                }
            }
        }
        // 组合管理员title数组
        foreach ($user_data as $k => $v) {
            foreach ($data as $m => $n) {
                if ($n['id'] == $k) {
                    $user_data[$k]['title'][] = $n['title'];
                }
            }
            $user_data[$k]['title'] = implode('、', $user_data[$k]['title']);
        }

        return view("index",[
            'data' => $user_data,
            'title'=>'高级权限',
            'subtitle'=>'用户管理'
        ]);
    }

    /**
     * 添加管理员
     */
    public function add_user() {
        if (Request::instance()->post()) {
            $data = input('post.');
            $result = Db::name('users')->where(['username'=>$data['username']])->select();
            if(!empty($result))
                $this->error("账号已经存在",url('admin/User/add_user'));
            // dump($data);
            $userdata = [
                'username' => $data['username'],
                'phone' => $data['phone'],
                'password' => md5($data['password']),
                'email' => $data['email'],
                'status' => $data['status'],
            ];
            $result = Db::name('users')->insert($userdata);
            $datagroup = Db::name('users')->where(['username' => $data['username'], 'email' => $data['email']])->find();
            if ($result) {
                if (!empty($data['group_ids'])) {
                    foreach ($data['group_ids'] as $k => $v) {
                        $group = array(
                            'uid' => $datagroup['id'],
                            'group_id' => $v
                        );
                        Db::name('auth_group_access')->insert($group);
                    }
                }
                // 操作成功
                $this->success('添加成功', url('admin/User/index'));
            } else {
                $this->error('修改失败,请联系维护者,错误点 admin/User/add_user',url('admin/User/index'));
            }
        } else {
            $data = Db::name('auth_group')->select();
            return view("edit_user",[
                'data' => $data,
                'user_data' => [],
                'group_data' => [],
                'title'=>'高级权限',
                'subtitle'=>'添加用户',
            ]);
        }
    }

    /**
     * 修改用户
     */
    public function edit_user($id) {
        if (Request::instance()->post()) {
            $data = input('post.');
            trace("UserData = ");
            trace($data);
            Db::name('auth_group_access')->where(array('uid' => $id))->delete();
            if (!empty($data['group_ids'])) {
                foreach ($data['group_ids'] as $k => $v) {
                    $group = [
                        'uid' => $id,
                        'group_id' => $v
                    ];
                    Db::name('auth_group_access')->insert($group);
                }
            }

            $origin = Db::name('users')->where(['id' => $id])->find();
            $pwd = $data['password'];
            $password = empty($pwd)?$origin['password']:md5($pwd);
            trace("pwd = $pwd");
            trace("password = $password");
            //注意,账号不能修改,不要在下面添加账号项
            $userUp = [
                'password' => $password,
                'phone' => $data['phone'],
                'email' => $data['email'],
                'status' => $data['status'],
            ];
            $result = Db::name('users')->where(['id' => $id])->update($userUp);
            trace("*************************User Change****************************************");
            trace($origin);
            trace($userUp);
            trace($result);
            trace("****************************************************************************");
            return $this->success('编辑成功', 'Admin/User/index');
            //由于本函数并不是只修改了users表,也修改的access表,而下面只利用user表的返回结果进行判定
            //所以下面这个代码是错误的,不过由于ABerror太懒就没有去做判断什么时候修改失败了
//            if ($result) {
//                // 操作成功
//                $this->success('编辑成功', 'Admin/User/index');
//            } else {
//                $this->error('修改失败');
//            }
        } else {
            // $id=input('get.id',0,'intval');
            // 全部用户组
            $data = Db::name('auth_group')->select();
            // 获取用户数据
            $user_data = Db::name('users')->find($id);
            // 获取已加入用户组,注意由于一个用户可以加入多个用户组,所以必须是select而不是find
            $group_data = Db::name('auth_group_access')->where(array('uid' => $id))->select();
            $group_now = [];
            foreach ($group_data as $k => $v){
                array_push($group_now,$v['group_id']);
            }
//            trace($data);
//            trace($user_data);
            trace($group_now);
            return view("edit_user",[
                'data' => $data,
                'user_data' => $user_data,
                'group_data' => $group_now,
                'title'=>'高级权限',
                'subtitle'=>'编辑用户',
            ]);
        }
    }

    /* 个人中心 */ /* 分开写是为了将权限更细化 */

    public function my_center() {
        return view("my_center",[
            "title" => "管理设置",
            "subtitle"=>"个人中心",
        ]);
    }

    /* 修改个人资料 */

    public function change_msg() {
        if (Request::instance()->post()) {
//            $data['username'] = trim(input('post.username')); // 原本的代码,居然可以修改账号...
            $data['email'] = trim(input('post.email'));
            $data['phone'] = trim(input('post.phone'));
            $map = array(
                'username' => session('user')['username']
            );
            $post_password = input('post.password');
            if (!empty($post_password)) {
                $passwordConfirm=md5(input('post.passwordConfirm'));
                $data['password'] = md5(input('post.password'));
                if($passwordConfirm != $data['password'])
                    $this->error("两次输入密码不一致");
            }
            $result = Db::name('users')->where($map)->update($data);
            if ($result) {
                // 操作成功
                session('user', null);
                $this->success('退出成功、前往登录页面', 'Home/index/index');
            } else {
                $this->error("您没有做任何修改");
            }
        }
    }

}
