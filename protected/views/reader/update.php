<?php
/* @var $this ReaderController */
/* @var $model Reader */

$this->breadcrumbs=array(
	'Readers'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Reader', 'url'=>array('index')),
	array('label'=>'Create Reader', 'url'=>array('create')),
	array('label'=>'View Reader', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Reader', 'url'=>array('admin')),
);
?>

<h1>Update Reader <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>