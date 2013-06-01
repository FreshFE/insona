<?php namespace App\LangBundle\Behaviors;

use Think\Behavior;
use Think\Cookie;

class CheckLang extends Behavior
{
	public function run(&$param)
	{
		if($_GET['language'] && $this->checkValid($_GET['language'])) {

			$lang = $_GET['language'];

			// 写入 Cookie
			Cookie::set('language', $lang);
		}
		// 检查 Cookie
		else if(Cookie::get('language') && $this->checkValid(Cookie::get('language'))) {
			$lang = Cookie::get('language');
		}
		// 默认情况
		else {
			$lang = 'zh-cn';
		}

		dump($lang);
	}

	public function checkValid($lang)
	{
		if(in_array($lang, array('zh-cn', 'en-us'))) {
			return true;
		}
		else {
			return false;
		}
	}
}