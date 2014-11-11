<?php
/* @var $this ReaderController */
/* @var $model Reader */

$this->breadcrumbs=array(
	'Readers'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Reader', 'url'=>array('index')),
	array('label'=>'Create Reader', 'url'=>array('create')),
	array('label'=>'Update Reader', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Reader', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Reader', 'url'=>array('admin')),
);
?>

<h1>View Reader #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'created',
		'updated',
	),
)); ?>
