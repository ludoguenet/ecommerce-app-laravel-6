@extends('layouts.master')

@section('content')
  <div class="col-md-12">
    <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
      <div class="col p-3 d-flex flex-column position-static">
        <strong class="d-inline-block mb-2 text-success">Catégorie 1</strong>
        <h5 class="mb-0">{{ $product->title }}</h5>
        <hr>
        <p class="mb-auto text-muted">{{ $product->description }}</p>
        <strong class="mb-auto font-weight-normal text-secondary">{{ $product->getPrice() }}</strong>
        <form action="{{ route('cart.store') }}" method="POST">
          @csrf
          <input type="hidden" name="product_id" value="{{ $product->id }}">
          <button type="submit" class="btn btn-success"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Ajouter au panier</button>
        </form>
      </div>
      <div class="col-auto d-none d-lg-block">
        <img src="{{ $product->image }}" alt="">
      </div>
    </div>
  </div>
@endsection
