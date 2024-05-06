<?php
require_once('bhavidb.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['company'])) {
    $selectedCompanyId = mysqli_real_escape_string($conn, $_POST['company']);

    $sql = "SELECT * FROM `customer` WHERE `Id` = '$selectedCompanyId'";
    $res = $conn->query($sql);

    if ($row = mysqli_fetch_assoc($res)) {
        $company_name = $row['Company_name'];
        $cname = $row['Name'];
        $cphone = $row['Phone'];
        $caddress = $row['Address'];
        $cemail = $row['Email'];
        $cgst = $row['Gst_no'];
    } else {
        echo "Company not found";
    }
}

if (isset($_POST["submit"])) {
    $Sid = mysqli_real_escape_string($conn, $_POST["Sid"]);
    $invoice_no = mysqli_real_escape_string($conn, $_POST["invoice_no"]);
    $invoice_date = date("Y-m-d", strtotime($_POST["invoice_date"]));
    $total_amount = floatval(mysqli_real_escape_string($conn, $_POST["total_amount"]));
    $total_taxable_value = floatval(mysqli_real_escape_string($conn, $_POST["total_taxable_value"]));
    $total_value = floatval(mysqli_real_escape_string($conn, $_POST["grand_total_value"]));
    $c_gst = mysqli_real_escape_string($conn, $_POST["cgst"]);
    $cgst_total = floatval(mysqli_real_escape_string($conn, $_POST["cgst_total"]));
    $sgst = mysqli_real_escape_string($conn, $_POST["sgst"]);
    $sgst_total = floatval(mysqli_real_escape_string($conn, $_POST["sgst_total"]));
    $igst = mysqli_real_escape_string($conn, $_POST["igst"]);
    $igst_total = floatval(mysqli_real_escape_string($conn, $_POST["igst_total"]));
    $total_tax_amount = floatval(mysqli_real_escape_string($conn, $_POST["total_tax_amount"]));
    $total_after_tax = floatval(mysqli_real_escape_string($conn, $_POST["total_after_tax"]));
    $words = mysqli_real_escape_string($conn, $_POST["words"]);
    $advance = floatval(mysqli_real_escape_string($conn, $_POST["advance"]));
    $balancewords = mysqli_real_escape_string($conn, $_POST["balancewords"]);
    $balance = floatval(mysqli_real_escape_string($conn, $_POST["balance"]));
    $terms = mysqli_real_escape_string($conn, $_POST["terms"]);
    $note = mysqli_real_escape_string($conn, $_POST["note"]);

   

    $sql = "UPDATE invoice SET 
            Company_name = '$company_name',
            Cname = '$cname',
            Cphone = '$cphone',
            Caddress = '$caddress',
            Cmail = '$cemail',
            Cgst = '$cgst',
            total_amount = '$total_amount',
            total_taxable_value = '$total_taxable_value',
            total_value = '$total_value',
            c_gst = '$c_gst',
            s_gst = '$sgst',
            i_gst = '$igst',
            cgst_total = '$cgst_total',
            sgst_total = '$sgst_total',
            igst_total = '$igst_total',
            total_tax_amount = '$total_tax_amount',
            total_amount_after_tax = '$total_after_tax',
            Totalinwords = '$words',
            Terms = '$terms',
            Note = '$note',
            advance = '$advance',
            balance = '$balance',
            balancewords = '$balancewords',
            status = ''
            WHERE Sid = '$Sid'";




    $sql3 = "UPDATE advancehistory SET  `advance`='$advance' WHERE Invoice_no= '$invoice_no'";
    $result = mysqli_query($conn, $sql3);




        if ($conn->query($sql)) {
            if (isset($_POST["qty"]) && is_array($_POST["qty"])) {
                $updateRows = [];
                $insertRows = [];

                // Iterate through service details
                for ($i = 0; $i < count($_POST["qty"]); $i++) {
                    $id = isset($_POST["id"][$i]) ? mysqli_real_escape_string($conn, $_POST["id"][$i]) : null;
                    $description = mysqli_real_escape_string($conn, $_POST["description"][$i]);
                    $hsn = mysqli_real_escape_string($conn, $_POST["hsn"][$i]);
                    $uom = mysqli_real_escape_string($conn, $_POST["uom"][$i]);
                    $qty = mysqli_real_escape_string($conn, $_POST["qty"][$i]);
                    $price = mysqli_real_escape_string($conn, $_POST["price"][$i]);
                    $amount = mysqli_real_escape_string($conn, $_POST["amount"][$i]);
                    $rate_of_tax = mysqli_real_escape_string($conn, $_POST["qty_gst"][$i]);
                    $taxable_value = mysqli_real_escape_string($conn, $_POST["qty_gst_total"][$i]);
                    $total_value_amount = mysqli_real_escape_string($conn, $_POST["total_value"][$i]);

                    // Add service details to the rows array

    

                    if (!empty($id)) {
                        // Existing row, add to updateRows
                        $updateRows[] = "( '$id', '$Sid', '$description', '$hsn', '$uom', '$qty', '$price', '$amount', '$rate_of_tax', '$taxable_value', '$total_value_amount')";
                    } else {
                        // New row, add to insertRows
                        $insertRows[] = "( '$Sid', '$description', '$hsn', '$uom', '$qty', '$price', '$amount', '$rate_of_tax', '$taxable_value', '$total_value_amount')";
                    }
                }
             
            if (!empty($updateRows)) {
                $updateSql = "INSERT INTO service (Id, Sid, description, HSN, UOM, Qty, price, amount, rate_of_tax, taxable_value, total_value_amount) VALUES ";
                $updateSql .= implode(",", $updateRows);
                $updateSql .= " ON DUPLICATE KEY UPDATE 
                                description = VALUES(description),
                                HSN = VALUES(HSN), 
                                UOM = VALUES(UOM), 
                                Qty = VALUES(Qty), 
                                price = VALUES(price), 
                                amount = VALUES(amount), 
                                rate_of_tax = VALUES(rate_of_tax),
                                taxable_value = VALUES(taxable_value),
                                total_value_amount = VALUES(total_value_amount)";
                $conn->query($updateSql);
            }
    
            // Insert into service table
            // Insert new rows
            if (!empty($insertRows)) {
                $insertSql = "INSERT INTO service (Sid, description, HSN, UOM, Qty, price, amount, rate_of_tax, taxable_value, total_value_amount) VALUES ";
                $insertSql .= implode(",", $insertRows);
                $conn->query($insertSql);
            }

            echo "<SCRIPT>
            window.alert('Invoice updated successfully;');
            window.location.href='print.php?Sid=$Sid';</SCRIPT>";
        }
    } else {
        echo "Invoice Update Failed: " . $conn->error;
    }
}
?>
    
