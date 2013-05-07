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

		// 输出微博
		/*
        $weibo = $this->getWeibo();
        $weibo = json_decode($weibo);
        $weibo = $weibo->statuses;
        $weibo = $weibo[0];
        $weibo = $weibo->text;

        $this->assign("weibo", $weibo);
        */

		$this->display();
	}

	protected function rmWeibo(){
        S('weiboCache', null);
    }

    protected function getWeibo(){

        // 获得缓存
        $value = S('weiboCache');

        // 判断缓存是否存在
        if(!$value){

            $value = $this->weibo();
            S('weiboCache', $value, 30);

        } else {
            // echo "存在Cache";
        }

        // 输出缓存
        // dump($value);
        return $value;
    }

    protected function weibo(){

        // 初始化一个 cURL 对象
        $curl = curl_init();

        // dump(curl_version());

        // 设置你需要抓取的URL
        curl_setopt($curl, CURLOPT_URL, 'https://api.weibo.com/2/statuses/user_timeline.json?source=3966378850&count=1&feature=0&trim_user=1&uid=2998852340');

        // 设置header
        // curl_setopt($curl, CURLOPT_HEADER, 1);

        // 设置cURL 参数，要求结果保存到字符串中还是输出到屏幕上。
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);  
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);

        // curl_easy_setopt(m_hcURL, CURLOPT_SSL_VERIFYPEER, 1)); 
        // curl_easy_setopt(m_hcURL, CURLOPT_ISSUERCERT,"curl-ca-bundle.cer")); 

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_USERPWD, 'yovofashion@sina.com:yovofashion');

        // 运行cURL，请求网页
        $data = curl_exec($curl);

        // dump(curl_error($curl));
        // dump(curl_errno($curl));

        // 关闭URL请求
        curl_close($curl);

        // dump($data);

        // 返回的数据
        return $data;

    }
}