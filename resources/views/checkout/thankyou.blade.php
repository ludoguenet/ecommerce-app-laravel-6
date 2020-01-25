@extends('layouts.master')

@section('content')
    <div class="col-md-12">
        <div class="jumbotron text-center">
            <h1 class="display-3">Merci!</h1>
            <p class="lead"><strong>Votre commande a été traitée avec succès</strong></p>
            <hr>
            <p>
                Vous rencontrez un problème? <a href="#">Nous contacter</a>
            </p>
            <p class="lead">
                <a class="btn btn-primary btn-sm" href="{{ route('products.index') }}" role="button">Continuer vers la boutique</a>
            </p>
        </div>
    </div>
@endsection
