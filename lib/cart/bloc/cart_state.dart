
part of 'cart_bloc.dart';

abstract class CartState{}

abstract class CartActionState extends CartState{}

class CartInitialState extends CartState{}

class CartSuccessState extends CartState{
  List<ProductDataModel> cartItems = [];

  CartSuccessState({required this.cartItems});
}
