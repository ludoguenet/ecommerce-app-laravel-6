@extends('layouts.master')

@section('extra-meta')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection

@section('content')
@if (Cart::count() > 0)
<div class="px-4 px-lg-0">
    <div class="pb-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                    <!-- Shopping cart table -->
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="p-2 px-3 text-uppercase">Produit</div>
                                </th>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2 text-uppercase">Prix</div>
                                </th>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2 text-uppercase">Quantité</div>
                                </th>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2 text-uppercase">Supprimer</div>
                                </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach (Cart::content() as $product)
                                <tr>
                                    <th scope="row" class="border-0">
                                        <div class="p-2">
                                            <img src="{{ asset('storage/' . $product->model->image) }}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                            <div class="ml-3 d-inline-block align-middle">
                                                <h5 class="mb-0"> <a href="{{ route('products.show', ['slug' => $product->model->slug]) }}" class="text-dark d-inline-block align-middle">{{ $product->model->title }}</a></h5><span class="text-muted font-weight-normal font-italic d-block">Catégories: @foreach ($product->model->categories as $category)
                                                    {{ $category->name }}{{ $loop->last ? '' : ', '}}
                                                @endforeach</span>
                                            </div>
                                        </div>
                                    </th>
                                    <td class="border-0 align-middle"><strong>{{ getPrice($product->subtotal()) }}</strong></td>
                                    <td class="border-0 align-middle">
                                        <select class="custom-select" name="qty" id="qty" data-id="{{ $product->rowId }}" data-stock="{{ $product->model->stock }}">
                                            @for ($i = 1; $i <= 5; $i++)
                                                <option value="{{ $i }}" {{ $product->qty == $i ? 'selected' : ''}}>
                                                    {{ $i }}
                                                </option>
                                            @endfor
                                        </select>
                                    </td>
                                    <td class="border-0 align-middle">
                                        <form action="{{ route('cart.destroy', $product->rowId) }}" method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i></a>
                                        </form>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <!-- End -->
                </div>
            </div>
            <div class="row p-4 bg-white rounded shadow-sm">
                <div class="col-lg-6">
                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Code coupon
                    </div>
                    @if (!request()->session()->has('coupon'))
                    <div class="p-4">
                        <p class="font-italic mb-4">Si vous détenez un code Coupon, entrez-le dans le champ ci-dessous</p>
                    <form action="{{ route('cart.store.coupon') }}" method="POST">
                        @csrf
                        <div class="input-group mb-4 border rounded-pill p-2">
                            <input type="text" placeholder="Entrez votre code ici" name="code" aria-describedby="button-addon3" class="form-control border-0">
                            <div class="input-group-append border-0">
                                <button id="button-addon3" type="submit" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Appliquer le coupon</button>
                            </div>
                        </div>
                    </form>
                    </div>
                    @else
                    <div class="p-4">
                        <p class="font-italic mb-4">Un coupon est déjà appliqué.</p>
                    </div>
                    @endif
                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Instructions pour le vendeur</div>
                    <div class="p-4">
                        <p class="font-italic mb-4">Si vous souhaitez ajouter des précisions à votre commande, merci de les rentrer dans le champ ci-dessous</p>
                        <textarea name="" cols="30" rows="2" class="form-control"></textarea>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Détails de la commande
                    </div>
                    <div class="p-4">
                        <p class="font-italic mb-4">Les frais éventuels de livraison seront calculés suivant les informations que vous avez transmises.</p>
                        <ul class="list-unstyled mb-4">
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Sous-total </strong><strong>{{ getPrice(Cart::subtotal()) }}</strong></li>
                        @if (request()->session()->has('coupon'))
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Coupon {{ request()->session()->get('coupon')['code'] }}

                        <form action="{{ route('cart.destroy.coupon') }}" method="POST" class="d-inline-block">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-sm btn-outline-danger"><i class="fa fa-trash"></i></button>
                        </form>
                        </strong><strong>{{ getPrice(request()->session()->get('coupon')['remise']) }}</strong></li>
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Nouveau Sous-total</strong><strong>
                        {{ getPrice(Cart::subtotal() - request()->session()->get('coupon')['remise'])}}
                        </strong></li>
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Taxe</strong><strong>
                        {{ getPrice((Cart::subtotal() - request()->session()->get('coupon')['remise']) * (config('cart.tax') / 100)) }}
                        </strong></li>
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong><strong>
                        {{ getPrice((Cart::subtotal() - request()->session()->get('coupon')['remise']) +(Cart::subtotal() - request()->session()->get('coupon')['remise']) * (config('cart.tax') / 100)) }}
                        </strong></li>
                        @else
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Taxe</strong><strong>{{ getPrice(Cart::tax()) }}</strong></li>
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                            <h5 class="font-weight-bold">{{ getPrice(Cart::total()) }}</h5>
                        </li>
                        @endif
                        </ul><a href="{{ route('checkout.index') }}" class="btn btn-dark rounded-pill py-2 btn-block"><i class="fa fa-credit-card" aria-hidden="true"></i> Passer à la caisse</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@else
<div class="col-md-12">
    <h5>Votre panier est vide pour le moment.</h5>
    <p>Mais vous pouvez visiter la <a href="{{ route('products.index') }}">boutique</a> pour faire votre shopping.
    </p>
</div>
@endif

@endsection

@section('extra-js')
<script>
    var qty = document.querySelectorAll('#qty');
    Array.from(qty).forEach((element) => {
        element.addEventListener('change', function () {
            var rowId = element.getAttribute('data-id');
            var stock = element.getAttribute('data-stock');
            var token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            fetch(`/panier/${rowId}`,
                {
                    headers: {
                        "Content-Type": "application/json",
                        "Accept": "application/json, text-plain, */*",
                        "X-Requested-With": "XMLHttpRequest",
                        "X-CSRF-TOKEN": token
                    },
                    method: 'patch',
                    body: JSON.stringify({
                        qty: this.value,
                        stock: stock
                    })
            }).then((data) => {
                console.log(data);
                location.reload();
            }).catch((error) => {
                console.log(error);
            });
        });
    });
</script>
@endsection
