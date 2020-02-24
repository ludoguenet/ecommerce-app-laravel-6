<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    public function discount($subtotal)
    {
        return ($subtotal * ($this->percent_off / 100));
    }
}
