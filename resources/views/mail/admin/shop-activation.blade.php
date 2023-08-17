@component('mail::message')
Thank you for creating a new shop on Kamusika Shopping. <br>
We are yet to approve your shop. When this is done you can get 
started by adding products to your shop. You can also view 
orders and posts in your shop.


Shop Name: {{$shop->name}} <br>
Shop Owner: {{$shop->user->name}}

@component('mail::button', ['url' => 'https://kamusika.com/owner'])
Visit Shop
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
