<?php
namespace app\home\controller;
use app\common\controller\Homebase;
use think\Request;
use think\Db;
/**
 * Login Controller
 */
class Index extends Homebase{
	/**
	 * 首页
	 */
	public function index(){
        if(isset(session('user')['id']) && isset(session('user')['username'])){
            $result = Db::name("users")
                ->where([
                    'id'=>session('user')['id'],
                    'username'=>session('user')['username']
                ])
                ->find();
            if(!empty($result))
                $this->success("已经登录，正在为您跳转",url("admin/index/index"));
        }
        if(Request::instance()->isPost()){
            // 做一个简单的登录 组合where数组条件 
            $map=input('post.');
            // dump($map);
            // exit();
            $map['password']=md5($map['password']);
            $data=Db::name('users')->where($map)->find();
            if (empty($data)) {
                $this->error('账号或密码错误');
            }else{
                $sdata=[
	                'id'=>$data['id'],
	                'username'=>$data['username'],
	                'avatar'=>$data['avatar'],
	                'email'=>$data['email'],
	                'phone'=>$data['phone'],
                ];
                session('user',$sdata);

                $this->success('登录成功、前往管理后台','admin/Index/index');
            }
        }else{
            return $this->fetch();
        }
	}

    /**
     * 注册
     */
    public function register(){
        $post = $this->request->post();
        if($post){
            $data['username'] = input('post.username');
            $data['email'] = input('post.email');
            $data['phone'] = input('post.phone');
            $data['password'] = md5(input('post.password'));

            /*
             * 各种检查
             */
            // 检查正则是否合理
            /*
             * 帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$
             * 密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)：^[a-zA-Z]\w{5,17}$
             * Email地址：^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$
             */
            if(!preg_match("/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/",$data['username']))
                $this->error("账号正则错误，请检查输入是否正确");
            if(!preg_match("/^\\w{6,18}$/",input('post.password')))
                $this->error("密码正则错误，请检查输入是否正确");
            if(!preg_match("/^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$/",$data['email']))
                $this->error("邮箱正则错误，请检查输入是否正确");
            // 检查账号是否存在
            $account = Db::name('users')->where('username',$data['username'])->select();
            if(!empty($account))
                $this->error("该账号已经存在");
            // 检查两次密码是否相同
            if(input('post.password') != input('post.passwordConfirm'))
                $this->error("两次输入密码不一致");


            // 插入用户信息，赋予普通用户权限，并且返回登录界面
            // 由于下面这里直接使用了group_id = 15，所以不能修改一般用户的id
            $result1 = Db::name('users')->insert($data);
            $id = Db::name('users')->getLastInsID();
            $result2 = Db::name('auth_group_access')->insert(['uid'=>$id,'group_id'=>15]);
            if ($result1 && $result2) {
                // 操作成功
                session('user', null);
                $this->success('退出成功、前往登录页面', 'Home/index/index');
            } else {
                $this->error("恭喜你遇见了本网站开发者也没有预见到的错误");
            }
        } else {
            return view('register');
        }
    }
    /**
     * 退出
     */
    // http://127.0.0.1/public/home/index/logout
    public function logout(){
        session('user',null);
        $this->success('退出成功、前往登录页面','home/Index/index');
    }
}

