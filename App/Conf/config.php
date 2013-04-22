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

	/**
	 * 项目缩略图名称和配置类型
	 */
	'PROJ_THUMB_TYPE' => array(

		// 默认样式，宽度，高度，模式
		'thumb' => array(200, 200, 'both'),

		// Product
		'392x422' => array(392, 422, 'both'),
		'215x100' => array(215, 100, 'both'),

		// Driver
		'150x170' => array(150, 170, 'both'),

		// Third
		'166x60' => array(166, 60, 'both'),
		'208x193' => array(208, 193, 'both'),
		'332x120' => array(332, 120, 'both'),

		// Download
		'290x156' => array(290, 156, 'both')
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
