<?php

return array(

	// 载入配置信息
	'LOAD_EXT_CONFIG' => 'auth,deploy',

	/**
	 * 配置静态资源路径
	 */
	'TMPL_PARSE_STRING' => array(
		
		'@/assets' 	=> '/assets',
		'@/admin' 	=> '/assets/admin',
		'@/images' 	=> '/upload/images'
	),

	'PROJ_THUMB_LINK' => '/assets/images/noimage.jpg',

	/**
	 * 项目缩略图名称和配置类型
	 */
	'PROJ_THUMB_TYPE' => array(

		// 默认样式，宽度，高度，模式
		'thumb' => array(200, 200, 'both'),

		// Product
		'392x422' => array(392, 422, 'both'),
		'215x100' => array(215, 100, 'both'),
		'470x350' => array(470, 350, 'both'),
		'475x386' => array(475, 386, 'both'),
		'680width' => array(680, 680, 'width'),
		
		// product logo
		'121x38' => array(121, 38, 'both'),

		// Driver
		'150x170' => array(150, 170, 'both'),

		// Third
		'166x60' => array(166, 60, 'both'),
		'208x193' => array(208, 193, 'both'),
		'332x120' => array(332, 120, 'both'),
		'250x44' => array(250, 44, 'both'),

		// Download
		'290x156' => array(290, 156, 'both'),

		// Banner - Home
		'1680x445' => array(1680, 445, 'both')
	),

	/**
	 * 路由配置
	 */
	'URL_ROUTER_ON'   => true,			//开启路由
	// 路由配置方法
	'URL_ROUTE_RULES' => array(
		'signup/:code' => array('Home/Account/register'),
		'signup' => array('Home/Account/register')
	)
);
