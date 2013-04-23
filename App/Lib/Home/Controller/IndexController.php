<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Auth as Auth;
use Think\Session as Session;

class IndexController extends Controller
{
	public function index()
	{
		$slides = M('Banner')->where(array('cid' => 6, 'hidden' => 1))->select();
		$this->assign('slides', $slides);

		$this->display();
	}
}