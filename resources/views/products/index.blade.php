@extends('layouts.master')

@section('content')
  @foreach ($products as $product)
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <small class="d-inline-block mb-2">Catégorie</small>
          <h5 class="mb-0">{{ $product->title }}</h5>
          <p class="mb-auto text-muted">{{ $product->subtitle }}</p>
          <strong class="mb-auto font-weight-normal text-secondary">{{ $product->getPrice() }}</strong>
          <a href="{{ route('products.show', $product->slug) }}" class="stretched-link btn btn-info">Consulter le produit</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img src="{{ $product->image }}" alt="">
        </div>
      </div>
    </div>
  @endforeach
@endsection
