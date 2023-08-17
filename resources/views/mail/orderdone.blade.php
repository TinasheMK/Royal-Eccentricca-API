@component('mail::message')
Order Complete!!
{{-- OrderNumber: {{$order->number}} --}}
Your order was picked up. The status of your order
has been changed to done. Check your orders.<br>


@component('mail::button', ['url' => 'https://kamusika.com/profile'])
View Orders
@endcomponent

Warm Regards,<br>
{{ config('app.name') }}
@endcomponent
