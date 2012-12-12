<?php
/** Error reporting */
error_reporting(E_ALL);

/** Include path **/
//ini_set('include_path', ini_get('include_path').';../Classes/');

/** PHPExcel */
include 'libs/PHPExcel.php';

/** PHPExcel_Writer_Excel2007 */
include 'libs/PHPExcel/Writer/Excel2007.php';

// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set properties
$objPHPExcel->getProperties()->setTitle("Base de datos de Ficheros" . date('H:i:s'));
$objPHPExcel->getProperties()->setSubject("Base de datos de Ficheros" .date('H:i:s'));
$objPHPExcel->getProperties()->setDescription("Base de datos de Ficheros" .date('H:i:s'));

//datos
$objPHPExcel->setActiveSheetIndex(0);
$objPHPExcel->getActiveSheet()->SetCellValue('A1', 'Hello');
$objPHPExcel->getActiveSheet()->SetCellValue('B2', 'world!');
$objPHPExcel->getActiveSheet()->SetCellValue('C1', 'Hello');
$objPHPExcel->getActiveSheet()->SetCellValue('D2', 'world!');

$objPHPExcel->getActiveSheet()->setTitle('Simple');

$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
$objWriter->save(str_replace('.php', '.xlsx', __FILE__));

header('location:exportar_exel.xlsx');
?>