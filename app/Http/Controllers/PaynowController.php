<?php

// use App\Models\Pickup;

// require_once '../../Libraries/Paynow/autoloader.php';
// include(app_path() . '\functions\prices.php');

$product = new Pickup();
$product->name = 'EastMAll';
$product->address = 'EastMAll';
$product->region_name = 'EastMAll';
$product->country = 'EastMAll';
$product->save();

/**
 * Just a small dummy logger. Remove in production
 *
 * @param StatusResponse $status
 * @return void
 */
function dummy_logger($status) {

    $str =  sprintf("Recieved updated from Paynow --> Payment Status: %s || ", $status->status());

    $str .= sprintf("Transaction ID: %s || ", $status->reference());
    $str .= sprintf("Paynow Reference: %s \n\n", $status->paynowReference());

    file_put_contents(__DIR__ . '/status.logs', $str);

}

        $paynow = new Paynow(
            '12085',
            'f16c5e2a-5b9d-4f9a-8ee3-7798ba0c1d32',
            'https://kamusika.com/owner/order/payment-complete',
            'https://kamusika.com/owner/order/payment-process-complete'
        );


$status = $paynow->processStatusUpdate();


// Check if the transaction was paid
if($status->paid()) {

    // Update transaction in DB maybe? 
    $reference =  $status->reference();


    // Get the reference of the Payment in paynow
    $paynowReference = $status->paynowReference();

    // Log out the data
    dummy_logger($status);
}