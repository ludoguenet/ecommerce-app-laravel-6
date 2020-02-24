<?php

namespace App\Listeners;

use App\Coupon;
use Illuminate\Queue\InteractsWithQueue;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Contracts\Queue\ShouldQueue;

class CartUpdatedListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($event)
    {
        $code = request()->session()->get('coupon');

        $coupon = Coupon::where('code', $code)->first();

        if ($coupon) {
            request()->session()->put('coupon', [
                'code' => $coupon->code,
                'remise' => $coupon->discount(Cart::subtotal())
            ]);
        }

    }
}
