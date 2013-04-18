<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Auth as Auth;
use Think\Session as Session;

class ProductController extends Controller
{
	public function index()
	{
		$datas = M('ProductDriver')->where(array('hidden' => 1))->select();

		$this->assign('datas', $datas);
		$this->display();
	}
}