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

    $quotation_no = mysqli_real_escape_string($conn, $_POST["quotation_no"]);
    $quotation_date = date("Y-m-d", strtotime($_POST["quotation_date"]));
    // $status = mysqli_real_escape_string($conn, $_POST["status"]);
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


    $sql = "INSERT INTO quotation (quotation_no, quotation_date, Company_name, Cname, Cphone, Caddress, Cmail, Cgst, total_amount, total_taxable_value, total_value, c_gst, s_gst, i_gst, cgst_total , sgst_total, igst_total, total_tax_amount, total_amount_after_tax, Totalinwords, Terms, Note, advance, balance, balancewords)
            VALUES ('$quotation_no', '$quotation_date', '$company_name', '$cname', '$cphone', '$caddress', '$cemail', '$cgst', '$total_amount', '$total_taxable_value' , '$total_value' ,'$c_gst' ,'$sgst', '$igst', '$cgst_total' , '$sgst_total' , '$igst_total' ,'$total_tax_amount' , '$total_after_tax' ,'$words' ,'$terms','$note', '$advance', '$balance', '$balancewords')";

    if ($conn->query($sql)) {
        $Sid = $conn->insert_id; // Get the inserted Sid

        if (isset($_POST["qty"]) && is_array($_POST["qty"])) {
            $sql2 = "INSERT INTO quservice (Sid, description, HSN, UOM, Qty, price, amount, rate_of_tax, taxable_value, total_value_amount) VALUES ";
            $rows = [];

            // Iterate through service details
            for ($i = 0; $i < count($_POST["qty"]); $i++) {
                $Sid = $conn->insert_id;
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
                $rows[] = "('$Sid', '$description', '$hsn', '$uom', '$qty', '$price','$amount', '$rate_of_tax', '$taxable_value' , '$total_value_amount')";
            }

            $sql2 .= implode(",", $rows);

            // Insert into service table
            if ($conn->query($sql2)) {
                echo "<SCRIPT>
                    window.alert('Quotation added successfully');
                    window.location.href='quprint.php?Sid=$Sid';
                   </SCRIPT>";
            } else {
                echo "Quotation added successfully " . $conn->error;
                echo "SQL Query: " . $sql;
            }
        } else {
            echo "Quotation added successfully" . $conn->error;
            echo "SQL Query: " . $sql;
        }
    } else {
        echo "Quotation Added Failed: " . $conn->error;
        echo "SQL Query: " . $sql;
    }
}

// window.location.href='quprint.php?Sid=$Sid';
?>

