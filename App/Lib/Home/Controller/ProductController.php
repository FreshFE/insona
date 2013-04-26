<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Auth as Auth;
use Think\Session as Session;

class ProductController extends Controller
{
	public function index()
	{
		$model = M('ProductCategory');
		$condition['hidden'] = 1;
		$page = $_GET['page'] ? $_GET['page'] : 1;
		$listRow = 3;

		$datas = $model->where($condition)->page($page, $listRow)->select();
		$this->assign('datas', $datas);

		$pager = $model->where($condition)->pager($page, $listRow);
		$this->assign('pager', $pager);

		$this->display();
	}

	public function view()
	{
		if(isset($_GET['aid']))
		{
			$condition['product_driver_id'] = $_GET['aid'];
		}
		else {
			echo '没有输入aid, 404!';
			exit();
		}

		$model = M('Product');
		$condition['hidden'] = 1;
		$page = $_GET['page'] ? $_GET['page'] : 1;
		$listRow = 20;


		$datas = $model->where($condition)->page($page, $listRow)->select();
		$this->assign('datas', $datas);

		$pager = $model->where($condition)->pager($page, $listRow);
		$this->assign('pager', $pager);

		$father = M('ProductCategory')->find($condition['product_driver_id']);;
		$this->assign('father', $father);

		$this->display();
	}

	public function detail()
	{
		if(isset($_GET['id']))
		{
			$condition['id'] = $_GET['id'];
		}
		else {
			echo '没有产品id, 404!';
			exit();
		}

		$model = M('Product');
		$condition['hidden'] = 1;

		$data = $model->where($condition)->find();
		$this->assign('data', $data);

		// 检查用户是否登录
		if(Session::get('com_auth_key'))
		{
			$this->assign('user_id', Session::get('com_auth_key'));
		}

		// 检查相关驱动
		$drivers = M('Driver')->where(array('hidden' => 1, 'driver_category_id' => $data['driver_id']))->select();
		$this->assign('drivers', $drivers);

		$this->display();
	}
}