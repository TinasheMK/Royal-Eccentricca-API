@component('mail::message')
New Order!!<br>
OrderNumber: {{$order->order_number}}<br>
Delivery Address: {{$order->shipping_adress}}<br>

<h4 style="color:green">Thank you for placing your order on Kamusika. Your order will be ready in a short while.
    You will be notified via email when it is ready.</h4>

<h4 style="color:">Here is what to bring on collection:<br>
<span style="">1. Your id<br>2. Your order number</span></h4>
Check your orders.<br>

@component('mail::button', ['url' => 'https://kamusika.com/profile'])
View Orders
@endcomponent

Warm Regards,<br>
{{ config('app.name') }}
@endcomponent
