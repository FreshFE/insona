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

		$condition['hidden'] = 1;
		$datas = M('Product')->where($condition)->select();
		$this->assign('datas', $datas);

		$father = M('ProductDriver')->find($condition['product_driver_id']);;
		$this->assign('father', $father);

		$this->display();
	}
}