<?php
require('bhavidb.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['convert_id'])) {
    $Sid = mysqli_real_escape_string($conn, $_POST['convert_id']);

    // Fetch data from the quotation table
    $sql_quotation = "SELECT * FROM `quotation` WHERE `Sid` = $Sid";
    $result_quotation = mysqli_query($conn, $sql_quotation);

    if (!$result_quotation) {
        die("Query failed: " . mysqli_error($conn) . ". Query: " . $sql_quotation);
    }
   // Fetch data from the quservice table
    $sql_service = "SELECT * FROM `quservice` WHERE `Sid` = $Sid";
    $result_service = mysqli_query($conn, $sql_service);
    

    if (!$result_service) {
        die("Query failed: " . mysqli_error($conn) . ". Query: " . $sql_service);
    }
   

    $rows_quservice = [];

    while ($row_quservice = mysqli_fetch_assoc($result_service)) {
        $rows_quservice[] = $row_quservice;

    }

    if (!$result_service) {
        die("Query failed: " . mysqli_error($conn) . ". Query: " . $sql_service);
    }

    function getInvoiceId($conn)
    {
        $query = "SELECT Invoice_no FROM invoice ORDER BY Invoice_no DESC LIMIT 1";

        if ($result = $conn->query($query)) {
            $row_cnt = $result->num_rows;

            $row = mysqli_fetch_assoc($result);

            if ($row_cnt == 0) {
                $nextInvoiceNumber = INVOICE_INITIAL_VALUE;
            } else {
                $nextInvoiceNumber = $row['Invoice_no'] + 1;
            }

            $formattedInvoiceNumber = sprintf('%04d', $nextInvoiceNumber);

            $result->free();

            return $formattedInvoiceNumber;
        }
    }

    $quotation_no = getInvoiceId($conn);

    // Fetching the Data
    $row_quotation = mysqli_fetch_assoc($result_quotation);
    $row_quservice = mysqli_fetch_assoc($result_service);
    $rows_quservice = [];
    while ($row_quservice = mysqli_fetch_assoc($result_service)) {
        $rows_quservice[] = $row_quservice;
    }
    


    $insert_sql = "INSERT INTO `invoice` (Invoice_no, Invoice_date, Company_name, Cname, Cphone, Caddress, Cmail, Cgst, total_amount, total_taxable_value, total_value, c_gst, s_gst, i_gst, cgst_total , sgst_total, igst_total, total_tax_amount, total_amount_after_tax, Totalinwords, Terms, Note, advance, balance, balancewords, status) 
                    VALUES ('$quotation_no', '" . $row_quotation['quotation_date'] . "', '" . $row_quotation['Company_name'] . "', '" . $row_quotation['Cname'] . "', '" . $row_quotation['Cphone'] . "', '" . $row_quotation['Caddress'] . "', '" . $row_quotation['Cmail'] . "','" . $row_quotation['Cgst'] . "', '" . $row_quotation['total_amount'] . "', '" . $row_quotation['total_taxable_value'] . "', '" . $row_quotation['total_value'] . "', '" . $row_quotation['c_gst'] . "', '" . $row_quotation['s_gst'] . "', '" . $row_quotation['i_gst'] . "', '" . $row_quotation['cgst_total'] . "', '" . $row_quotation['sgst_total'] . "', '" . $row_quotation['igst_total'] . "', '" . $row_quotation['total_tax_amount'] . "', '" . $row_quotation['total_amount_after_tax'] . "', '" . $row_quotation['Totalinwords'] . "','" . $row_quotation['Terms'] . "','" . $row_quotation['Note'] . "','" . $row_quotation['advance'] . "','" . $row_quotation['balance'] . "','" . $row_quotation['balancewords'] . "', ' ')";
    //  echo  $row_quotation['quotation_date'];                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
            if ($conn->query($insert_sql)) {
         $newInvoiceId = $conn->insert_id;
            
        $sql_service = "SELECT * FROM `quservice` WHERE `Sid` = '$Sid'";
            $result_service = mysqli_query($conn, $sql_service);



    if (!$result_service) {
        die("Query failed: " . mysqli_error($conn) . ". Query: " . $sql_service);
    }

    

    $rows_quservice = [];

    while ($row_quservice = mysqli_fetch_assoc($result_service)) {
        $rows_quservice[] = $row_quservice;
        // var_dump($row_quservice["Sname"]);
    }
        // if (isset($_POST["Sname"]) && is_array($_POST["Sname"])) {
        $sql2 = "INSERT INTO service (Sid, description, HSN, UOM, Qty, price, amount, rate_of_tax, taxable_value, total_value_amount) VALUES ";
        $rows = []; // Declare $rows here


        foreach ($rows_quservice as $row_quservice) {
            $description = $row_quservice["description"];
            $hsn = $row_quservice["HSN"];
            $uom = $row_quservice["UOM"];
            $qty = $row_quservice["Qty"];
            $price = $row_quservice["price"];
            $amount = $row_quservice["amount"];
            $qty_gst = $row_quservice["rate_of_tax"];
            $qty_gst_total = $row_quservice["taxable_value"];
            $total_value = $row_quservice["total_value_amount"];

            // Add service details to the rows array
            $rows[] = "('$newInvoiceId', '$description', '$hsn', '$uom','$qty', '$price', '$amount', '$qty_gst', '$qty_gst_total','$total_value')";
        }


        if (!empty($rows)) {
            $sql2 .= implode(",", $rows);

            if ($conn->query($sql2)) {
                echo "<SCRIPT>
                    window.alert('Invoice added successfully');
                    window.location.href='print.php?Sid=$newInvoiceId';
                </SCRIPT>";
            } else {
                echo "Error: " . $sql2 . "<br>" . $conn->error;
            }
        } else {
            echo "Error: No service details found.";
        }
    }
}


