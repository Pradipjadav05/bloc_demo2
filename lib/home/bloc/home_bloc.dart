import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../cart/bloc/cart_bloc.dart';
import '../../data/cart_item.dart';
import '../../data/product_data.dart';
import '../../data/wishlist_item.dart';
import '../../wishlist/bloc/wishlist_bloc.dart';
import '../models/products_data_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
    on<HomeProductWishlistButtonNavigateEvent>(homeProductWishlistButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    // emit(HomeLoadedSuccessState(
    //   productDataModel: ProductData.groceryProducts
    //       .map((product) => ProductDataModel(
    //             id: product['id'],
    //             name: product['name'],
    //             description: product['description'],
    //             price: product['price'],
    //             imageUrl: product['imageUrl'],
    //           ))
    //       .toList(),
    // ));

    emit(HomeLoadedSuccessState(productDataModel: ProductData.product));
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, emit) {
    print("Cart Button Clicked");

    if(!CartItems.cartItems.contains(event.clickedProduct)){
      CartItems.cartItems.add(event.clickedProduct);
      emit(HomeLoadedSuccessState(productDataModel: ProductData.product));
      emit(HomeProductItemCartedActionState());
    }else{
      CartItems.cartItems.remove(event.clickedProduct);
      emit(HomeLoadedSuccessState(productDataModel: ProductData.product));
    }


  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter emit) {
    print("Favourite Button Clicked");
    if(!WishlistItem.wishlistListItem.contains(event.clickedProduct)){
      WishlistItem.wishlistListItem.add(event.clickedProduct);
      emit(HomeLoadedSuccessState(productDataModel: ProductData.product));
      emit(HomeProductItemWishListedActionState());
    }else{
      WishlistItem.wishlistListItem.remove(event.clickedProduct);
      emit(HomeLoadedSuccessState(productDataModel: ProductData.product));
    }
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart Navigation Button Clicked");
    emit(HomeNavigateToCartPageActionState());

  }

  FutureOr<void> homeProductWishlistButtonNavigateEvent(HomeProductWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Favourite Navigation Button Clicked");
    emit(HomeNavigateToWishlistPageActionState());

  }
}
