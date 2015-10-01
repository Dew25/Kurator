<?php $title="Первая страничка"; ?>
<?php ob_start(); ?>
<div class="div-group-selector"><select name="_select-group" id="select-group">
		<option value="1PTVR">1PTVR</option>
		<option value="2PTVR">2PTVR</option>
		<option value="3PTVR">3PTVR</option>
	</select></div>
<div class="div-date"><input type="text" name="_month" id="month"><input type="text" name="_year" id="year"></div>
<select name="_select-list" id="select-list" multiple="true" size="22">
	<option value="1">Фамилии</option>
	<option value="2">Фамилии</option>
	<option value="3">Фамилии</option>
	<option value="4">Фамилии</option>
	<option value="5">Фамилии</option>
	<option value="6">Фамилии</option>
	<option value="7">Фамилии</option>
	<option value="8">Фамилии</option>
	<option value="9">Фамилии</option>
	<option value="10">Фамилии</option>
	<option value="11">Фамилии</option>
	<option value="12">Фамилии</option>
	<option value="13">Фамилии</option>
	<option value="14">Фамилии</option>
	<option value="15">Фамилии</option>
	<option value="16">Фамилии</option>
	<option value="17">Фамилии</option>
	<option value="18">Фамилии</option>
	<option value="19">Фамилии</option>
	<option value="20">Фамилии</option>
	<option value="21">Фамилии</option></select>
<?php $content=ob_get_clean(); ?>	
<?php include 'layout.php'; ?>