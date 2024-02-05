<?php
require('bhavidb.php');
$Sid = (isset($_GET['Sid']) && $_GET['Sid'] !== '') ? $_GET['Sid'] : 0;
$sql = "SELECT * FROM `quotation` 
        JOIN `quservice` ON `quotation`.`Sid` = `quservice`.`Sid` 
        WHERE `quotation`.`Sid` = $Sid;";

$result = mysqli_query($conn, $sql);

$sql2 = "SELECT * FROM quservice WHERE quservice.Sid = $Sid;";
$result2 = mysqli_query($conn, $sql2);

if (!$result) {
	die("Query failed: " . mysqli_error($conn) . ". Query: " . $sql);
}

$row = mysqli_fetch_assoc($result);

$html = '
<html>
<head>
<style>
body {font-family: sans-serif;
	font-size: 10pt;
}
p {	margin: 0pt; }
table.items {
	border: 0.1mm solid #000000;
}
td { vertical-align: top; }
.items td {
	border-left: 0.1mm solid #000000;
	border-right: 0.1mm solid #000000;
}
table thead td { background-color: #EEEEEE;
	text-align: center;
	border: 0.1mm solid #000000;
	font-variant: small-caps;
	font-size: 12px;
	font-weight: bold;
}
.items td.blanktotal {
	background-color: #EEEEEE;
	border: 0.1mm solid #000000;
	background-color: #FFFFFF;
	border: 0mm none #000000;
	border-top: 0.1mm solid #000000;
	border-right: 0.1mm solid #000000;
}
.items td.totals {
	text-align: center;
	border: 0.1mm solid #000000;
}
.items td.cost {
	text-align: "." center;
}

.table-heading{
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 20px;
}
.table-content{
	font-size: 12px;
}
.term{
	style="border: none;"
}
</style>
</head>
<body>

<!--mpdf
<htmlpageheader name="myheader">
    <table width="100%" height="50%">
        <tr>
            <td style="text-align: center;">
                <img src="img/me_log.jpg" alt="" class="" height="10%" width="50%">
            </td>
        </tr>
    </table>
</htmlpageheader>

<htmlpagefooter name="myfooter">

<div style="border-top: 1px solid #000000; font-size: 9pt; text-align: center; padding-top: 3mm; ">
Page {PAGENO} of {nb}
</div>
</htmlpagefooter>

<sethtmlpageheader name="myheader" value="on" show-this-page="1" />
<sethtmlpagefooter name="myfooter" value="on" show-this-page="lastpage" />
mpdf-->
<table width="100%" height="100%">
<tr>
<td colspan="2" style="text-align: center; font-size: 15px;"> Prop. TAMMIRAJU MARISETTY</td>
</tr>
<tr>
<td colspan="2" style="text-align: center; font-size: 15px;">#7-88, Atchampeta Junction, Kakinada, E.G.Dt.A.P. - 533 005.</td>
</tr>
<tr>
<td colspan="2" style="text-align: center; font-size: 15px;"> Cell: 9948388889</td>
</tr>
</table>

<table width="100%" style="font-family: Arial;border: 1px " cellpadding="8" class="table-heading">

<tr >
<td colspan="2" style="text-align: center;">QUOTATION</td></tr>
<tr>
<td width="40%" style="text-align: left; font-size: 15px;">BUYER DETAILS</td>
<td style="text-align: ; font-size: 15px;">QUOTATION DETAILS</td>
</tr>
<tr>
<td width="70%" style="text-align: left;">
DATE:  ' . $row['quotation_date'] . '
</td>
<td width="40%" style="text-align: left;">
Quotation No :' . $row['quotation_no'] . '
</td>
</tr>
</table>

<table width="100%" style="font-family: Arial; font-size: 15px;" cellpadding="10"><tr>
<td width="45%" style=" "><span style="font-size: 7pt; color: #555555; font-family: sans;">Bill of Party From:</span><br /><br/> ' . $row['Company_name'] . ', <br />' . $row['Cname'] . ', <br /> ' . $row['Caddress'] . ' <br /> ' . $row['Cphone'] . ', <br /> ' . $row['Cmail'] . ' <br /> ' . $row['Cgst'] . '</td>
<td width="30%"></td>
<td width="45%" style=""><span style="font-size: 7pt; color: #555555; font-family: sans;">Ship To Party:</span><br/> </td>
</tr></table>

<br />

<table class="items" width="100%" style="border-collapse: collapse; " cellpadding="8">
<thead>

<tr>
    <td>Si.no</td>
    <td>Description of Supply</td>
    <td >HSN</td>
    <td >UOM</td>
    <td>Qty</td>
    <td >Rate</td>
    <td >Amount</td>
    <td>Rate of Tax</td>
    <td >Taxable Value</td>
    <td >Total Value</td>
</tr>
</thead>
<tbody>';
$counter = 1;
while ($data = mysqli_fetch_assoc($result2)) {
	$html .= '
		<tr >
			<td class="serial-number">' . sprintf('%02d', $counter) . '</td>
			<td class="table-content" align="center">' . $data["description"] . ' </td>
			<td class="table-content" align="center" style="word-wrap: break-word;">' . $data['HSN'] . '</td>
			<td class="table-content" align="center">' . $data['UOM'] . '</td>
			<td class="cost table-content">' . $data['Qty'] . '</td>
			<td class="cost table-content">' . $data['price'] . '</td>
			<td class="cost table-content">' . $data['amount'] . '</td>
			<td class="cost table-content">' . $data['rate_of_tax'] . '</td>
			<td class="cost table-content">' . $data['taxable_value'] . '</td>
			<td class="cost table-content">' . $data['total_value_amount'] . '</td>
		</tr>';
	$counter++;
}

$html .= '
<tr>
	<td class="totals cost table-content" colspan="5" rowspan="1">' . $row['Totalinwords'] . '</td>
	<td class="totals table-content ">Totals:</td>
		<td class="totals cost table-content">' . $row['total_amount'] . '</td>
		<td class="totals  table-content"></td>
		<td class="totals cost table-content">' . $row['total_taxable_value'] . '</td>
		<td class="totals cost table-content">' . $row['total_value'] . '</td>
</tr>
 <tr>
<td class="totals cost table-content" style="" colspan="2"><b>Bank Details<b></td>
<td colspan="4" class="cost table-content"></td>
 <td class="totals cost table-content"  >CGST %</td>
 <td class=" totals cost table-content">' . $row['c_gst'] . '</td>
<td class="totals cost table-content">' . $row['cgst_total'] . '</td>
</tr>
<tr>
<td class="totals cost table-content" style="" colspan="2"><b>Bank Name:</b>ICICI Bank</td>
<td colspan="4"></td>
<td class="totals cost table-content" >SGST %</td>
<td class="totals cost table-content">' . $row['s_gst'] . '</td>
<td class="totals cost table-content">' . $row['sgst_total'] . '</td>
</tr>
<tr>
<td class="totals cost table-content" style="" colspan="2"><b>A/C No:</b>247705500400</td>
<td colspan="4"></td>
<td class="totals cost table-content">IGST %</td>
<td class="totals cost table-content">' . $row['i_gst'] . '</td>
<td class="totals cost table-content">' . $row['igst_total'] . '</td>
</tr>
<tr>
<td class="totals cost table-content" style="" colspan="2"><b>IFSC Code:</b>ICIC0002477</td>
<td colspan="4"></td>
<td class="totals cost table-content" colspan="2">Total Tax Amount</td>
<td class="totals cost table-content">' . $row['total_tax_amount'] . '</td>
</tr>
 <tr>
<td class="totals cost table-content" style="" colspan="2"></td>
<td colspan="4"></td>
<td class="totals table-content"  colspan="2">Total Amount After Tax</td>
<td class="totals cost table-content">' . $row['total_amount_after_tax'] . '</td>
</tr>
<tr>
<td class="totals cost table-content" style="" colspan="2"></td>
<td colspan="4"></td>
<td class="totals table-content"  colspan="2">Advance</td>
<td class="totals cost table-content">' . $row['advance'] . '</td>
</tr>
<tr>
<td class="totals cost table-content" style="" colspan="6">' . $row['balancewords'] . '</td>
<td class="totals table-content"  colspan="2">Balance</td>
<td class="totals cost table-content">' . $row['balance'] . '</td>
</tr>

</tbody>
 </table>
 <br/>
 <p style="font-weight: bold;">Terms&Conditions</p>
 <p>' . $row['Terms'] . '</p>
 <br/>
 <p style="font-weight: bold;">Note:</p>
 <p>' . $row['Note'] . '</p>
 
</body>
</html>
';

$path = (getenv('MPDF_ROOT')) ? getenv('MPDF_ROOT') : __DIR__;
require_once $path . '/vendor/autoload.php';

$mpdf = new \Mpdf\Mpdf([
	'margin_left' => 15,
	'margin_right' => 15,
	'margin_top' => 35,
	'margin_bottom' => 25,
	'margin_header' => 12,
	'margin_footer' => 10
]);

$mpdf->SetProtection(array('print'));
$mpdf->SetTitle("Bhavi Creations. - Invoice");
$mpdf->SetAuthor("Bhavi Creations.");
$mpdf->SetWatermarkText("");
$mpdf->showWatermarkText = true;
$mpdf->watermark_font = 'DejaVuSansCondensed';
$mpdf->watermarkTextAlpha = 0.1;
$mpdf->SetDisplayMode('fullpage');

$mpdf->WriteHTML($html);


$mpdf->Output();
die();
