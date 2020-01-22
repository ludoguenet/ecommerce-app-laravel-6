@extends('layouts.master')

@section('content')
<div class="col-md-12">
  <h1>Procéder au paiement</h1>
  <div class="col-md-6 my-3 mx-auto">
      <form action="{{ route('checkout.charge') }}" method="POST" id="payment-form">
          @csrf
          <div id="card-element">
          <!-- Elements will create input elements here -->
          </div>

          <!-- We'll put the error messages in this element -->
          <div id="card-errors" role="alert"></div>

          <button id="submit" class="btn btn-success btn-block mt-3">Soumettre le paiement</button>
      </form>
    </div>
</div>
@endsection

@section('script')
<script>
var stripe = Stripe('pk_test_LI2JPcWlrGhmjPeXnppRdMxu00J9G81wVp');
var elements = stripe.elements();
    // Set up Stripe.js and Elements to use in checkout form
var style = {
  base: {
    color: "#32325d",
  }
};

var card = elements.create("card", { style: style });
card.mount("#card-element");

card.addEventListener('change', ({error}) => {
  const displayError = document.getElementById('card-errors');
  if (error) {
    displayError.textContent = error.message;
  } else {
    displayError.textContent = '';
  }
});

var submitButton = document.getElementById('submit');

submitButton.addEventListener('click', function(ev) {
  ev.preventDefault();

  var clientSecret = "{{ $client_secret }}";
  stripe.confirmCardPayment(clientSecret, {
    payment_method: {card: card}
  }).then(function(result) {
    if (result.error) {
      // Show error to your customer (e.g., insufficient funds)
      console.log(result.error.message);
    } else {
      // The payment has been processed!
      if (result.paymentIntent.status === 'succeeded') {
        let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        let paymentIntent = result.paymentIntent;
        let form = document.getElementById('payment-form');
        let url = form.action;
        let redirect = '/merci';
        fetch(
          url,
          {
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json, text-plain, */*",
            "X-Requested-With": "XMLHttpRequest",
            "X-CSRF-TOKEN": token
          },
          method: 'post',
          body: JSON.stringify({
            paymentIntent : paymentIntent
          })
        })
        .then((data) => {
          form.reset();
          console.log(data);
        })
        .catch((error) => {
          console.log(error);
        });
      }
    }
  });
});
</script>
@endsection
