@extends('layouts.master')

@section('extra-meta')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection

@section('extra-script')
<script src="https://js.stripe.com/v3/"></script>
@endsection

@section('content')
<div class="col-md-12">
    <a href="{{ route('cart.index') }}" class="btn btn-sm btn-secondary mt-3"><i class="fa fa-angle-double-left" aria-hidden="true"></i> Retour</a>
    <div class="row">
        <div class="col-md-6 mx-auto">
            <h4 class="pt-5">Total: <span class="text-info">{{ getPrice(Cart::total()) }}</span></h4>
            <form action="{{ route('checkout.store') }}" method="POST" class="my-4" id="payment-form">
                @csrf
                <div id="card-element">
                <!-- Elements will create input elements here -->
                </div>

                <!-- We'll put the error messages in this element -->
                <div id="card-errors" role="alert"></div>

                <button class="btn btn-success btn-block mt-3" id="submit">
                    <i class="fa fa-credit-card" aria-hidden="true"></i> Payer maintenant
                </button>
            </form>
        </div>
    </div>
</div>
@endsection

@section('extra-js')
<script>
    //Suppression de la barre de navigation
    document.getElementsByClassName('blog-header')[0].classList.add("d-none");
    document.getElementsByClassName('nav-scroller')[0].classList.add("d-none");

    // Paiement Stripe
    var stripe = Stripe('pk_test_7SgrmpMGeJlIACKBTE2YbTXF00Q3876Bck');
    var elements = stripe.elements();
    var style = {
        base: {
        color: "#32325d",
        fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
        fontSmoothing: "antialiased",
        fontSize: "16px",
            "::placeholder": {
                color: "#aab7c4"
            }
        },
        invalid: {
            color: "#fa755a",
            iconColor: "#fa755a"
        }
    };
    var card = elements.create("card", { style: style });
    card.mount("#card-element");
    card.addEventListener('change', ({error}) => {
    const displayError = document.getElementById('card-errors');
        if (error) {
            displayError.classList.add('alert', 'alert-warning', 'mt-3');
            displayError.textContent = error.message;
        } else {
            displayError.classList.remove('alert', 'alert-warning', 'mt-3');
            displayError.textContent = '';
        }
    });

    var submitButton = document.getElementById('submit');

    function resetButton()
    {
        submitButton.disabled = false;
        submitButton.innerHTML = "<i class='fa fa-credit-card' aria-hidden='true'></i> Payer maintenant";
    }

    submitButton.addEventListener('click', function(ev) {
    ev.preventDefault();
    submitButton.disabled = true;
    submitButton.innerHTML = "⌛ Merci de patienter...";
    stripe.confirmCardPayment("{{ $clientSecret }}", {
        payment_method: {
            card: card
        }
        }).then(function(result) {
            if (result.error) {
            // Show error to your customer (e.g., insufficient funds)
            resetButton()
            console.log(result.error.message);
            } else {
                // The payment has been processed!
                if (result.paymentIntent.status === 'succeeded') {
                    var paymentIntent = result.paymentIntent;
                    var token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
                    var form = document.getElementById('payment-form');
                    var url = form.action;
                    var redirect = '/merci';

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
                                paymentIntent: paymentIntent
                            })
                        }).then((data) => {
                            console.log(data);
                            form.reset();
                            window.location.href = redirect;
                    }).catch((error) => {
                        resetButton()
                        console.log(error)
                    })
                }
            }
        });
    });
</script>
@endsection
