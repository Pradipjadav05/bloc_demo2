import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo2/data/cart_item.dart';

import '../../home/models/products_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  CartBloc(): super(CartInitialState()){
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: CartItems.cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    CartItems.cartItems.remove(event.removeProduct);
    emit(CartSuccessState(cartItems: CartItems.cartItems));
  }
}