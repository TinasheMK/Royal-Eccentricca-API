@component('mail::message')
New Order!!
{{-- OrderNumber: {{$order->number}} --}}
Check your orders. A new order was placed on Kamusika Shopping.<br>


@component('mail::button', ['url' => 'https://kamusika.com/owner'])
View Orders
@endcomponent

Warm Regards,<br>
{{ config('app.name') }}
@endcomponent
