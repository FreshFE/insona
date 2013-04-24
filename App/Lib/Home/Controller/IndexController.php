<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Auth as Auth;
use Think\Session as Session;

class IndexController extends Controller
{
	public function index()
	{
		// Banner
		$slides = M('Banner')->where(array('cid' => 6, 'hidden' => 1))->select();
		$this->assign('slides', $slides);

		$Intro = M('Introduction');

		// 公司简介
		$intro = $Intro->find(1);
		$this->assign('intro', $intro);

		// 产品展示
		$product = $Intro->find(2);
		$this->assign('product', $product);

		// 联系方式
		$contact = $Intro->find(3);
		$this->assign('contact', $contact);

		$this->display();
	}
}