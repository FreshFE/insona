<?php

use Think\Controller as Controller;

class AboutController extends Controller
{
	public function index()
	{
		$Intro = M('Introduction');

		// 基本介绍
		$intro = $Intro->find(1);
		$this->assign('intro', $intro);

		// 联系信息
		$contact = $Intro->find(3);
		$this->assign('contact', $contact);

		$this->display();
	}
}