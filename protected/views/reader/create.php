<?php
/* @var $this ReaderController */
/* @var $model Reader */

$this->breadcrumbs=array(
	'Readers'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Reader', 'url'=>array('index')),
	array('label'=>'Manage Reader', 'url'=>array('admin')),
);
?>

<h1>Create Reader</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>