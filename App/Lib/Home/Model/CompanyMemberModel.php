<?php

use Think\Model as Model;

class CompanyMemberModel extends Model
{
	protected $_auto = array(
		array('birthday', 'strtotime', 1, 'function'),
		array('hidden', 1, 1),
		array('createline', 'time', 1, 'function'),
		array('password', 'sha1', 3, 'function')
	);

	protected $_validate = array(
		
		array('username', 'require', '必填姓名', 1),
		array('phone', 'require', '必填手机', 1),
		array('company', 'require', '必填公司名称', 1),
		array('birthday', 'require', '必填生日', 1),
		array('idcard', 'require', '必填证件号', 1),
		array('country', 'require', '必填国家', 1),
		array('email', 'require', '必填电子邮件', 1),
		array('city', 'require', '必填城市', 1),
		array('password', 'require', '必填密码', 1),
		array('address', 'require', '必填地址', 1),
		array('install_type', 'require', '必填安装方式', 1),
		array('install_way', 'require', '必填安装途径', 1),
		
		array('username', 'require', '该姓名已存在', 1, 'unique'),
		array('password', '6,16', '密码长度应在6到16之间', 1, 'length'),
		array('repassword', 'password', '确认密码不正确', 1, 'confirm')
	);
}