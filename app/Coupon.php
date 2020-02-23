<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    public function discount($subtotal)
    {
        return (($this->percent_off / 100) * $subtotal);
    }
}
