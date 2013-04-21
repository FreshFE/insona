<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Auth as Auth;
use Think\Session as Session;

class ProductviewController extends Controller
{
	public function index()
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
}