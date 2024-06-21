part of 'home_bloc.dart';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  List<ProductDataModel> productDataModel;

  HomeLoadedSuccessState({required this.productDataModel});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistActionState extends HomeActionState {
  final ProductDataModel clickedProduct;

  HomeProductItemWishlistActionState({required this.clickedProduct});
}

class HomeProductCartActionState extends HomeActionState {}

class HomeProductItemWishListedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}