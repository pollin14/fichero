<?php

require_once 'configuracion.php';
require_once 'funciones.php';

$db = dameConexion();
$query = 'select * from fichas order by nombre;';
$fichas = $db->query($query);

/** Error reporting */
error_reporting(E_ALL);

/** Include path * */
//ini_set('include_path', ini_get('include_path').';../Classes/');

/** PHPExcel */
include 'libs/PHPExcel.php';

/** PHPExcel_Writer_Excel2007 */
include 'libs/PHPExcel/Writer/Excel2007.php';

// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set properties
$objPHPExcel->getProperties()->setTitle("Fichas" . date('H:i:s'));
$objPHPExcel->getProperties()->setSubject("Base de datos de Ficheros" . date('H:i:s'));
$objPHPExcel->getProperties()->setDescription("Base de datos de Ficheros" . date('H:i:s'));

//datos
$objPHPExcel->setActiveSheetIndex(0);


if( $fichas ){
	$columna = 1;
	$fila = 1;
	$r_cols = $fichas->fetch_fields();
	
	$i = 1;
	foreach($r_cols as $val){		
		$objPHPExcel->getActiveSheet()->setCellValueExplicitByColumnAndRow($i,$fila, $val->name);
		$i++;
	}
	
	$fila++;
	
	while ($ficha = $fichas->fetch_assoc()) {

		foreach ($ficha as $val) {
			$objPHPExcel->getActiveSheet()->setCellValueExplicitByColumnAndRow($columna,$fila, $val);
			$columna++;
		}
		$columna = 1;
		$fila++;
	}
}
	

$objPHPExcel->getActiveSheet()->setTitle('Fichas');

$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
$objWriter->save(str_replace('.php', '.xlsx', __FILE__));

header('location:exportar_exel.xlsx');
?>