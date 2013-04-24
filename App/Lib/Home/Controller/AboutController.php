<?php

use Think\Controller as Controller;

class AboutController extends Controller
{
	public function index()
	{
		$contact = M('Introduction')->find(3);
		$this->assign('contact', $contact);

		$this->display();
	}
}