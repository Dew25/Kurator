<?php $title="List"; ?>
<?php $link="<link rel='stylesheet' href='view/css/list.css'>";?>

<?php ob_start(); ?>
<div class="row">
	<div class="div-group-selector">
		<select name="_select-group" id="select-group" class="span3">
			<?php foreach ($groups as $group): ?>
				<option value=<?php echo $group['id']; ?>><?php echo $group['name']; ?></option>
			<?php endforeach; ?>
		</select>
	</div>
	<div class="div-date offset3">
		<input type="text" name="_month" id="month" class="span2">
		<input type="text" name="_year" id="year" class="span2">
	</div>
</div>
	<select name="_select-list" id="select-list" multiple="true" size="<?php echo count($student); ?>">
		<?php $i=1; foreach ($students as $student): ?>
			<option value="<?php echo $student['id']; ?>"><?php echo $i.'. '.$student['family'].' '.$student['name']; ?></option>
		<?php $i++; endforeach; ?>
	</select>
<?php $content=ob_get_clean(); ?>	
<?php include 'layout.php'; ?>