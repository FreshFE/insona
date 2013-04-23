<?php

use Think\Model as Model;

class SupportModel extends Model
{
	protected $_auto = array(
		array('createline', 'time', 1, 'function'),
		array('updateline', 'time', 3, 'function')
	);

	protected $_validate = array(
		
		array('title', 'require', '必填标题', 1),
		array('product', 'require', '必填产品型号', 1),
		array('content', 'require', '必填意见内容', 1),
	);
}