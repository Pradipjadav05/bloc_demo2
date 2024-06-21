import 'package:bloc_demo2/cart/bloc/cart_bloc.dart';
import 'package:bloc_demo2/cart/widget/cart_tile_widget.dart';
import 'package:bloc_demo2/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  final CartBloc cartBloc;
  final WishlistBloc wishlistBloc;
  const CartScreen({super.key, required this.cartBloc, required this.wishlistBloc});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {



  @override
  void initState() {
    super.initState();
    widget.cartBloc.add(CartInitialEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
        backgroundColor: Colors.blueGrey,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: widget.cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch(state.runtimeType){
            case CartInitialState:
              return const Center(child: CircularProgressIndicator(color: Colors.blueGrey));
            case CartSuccessState:
              final successState = state as CartSuccessState;
              if(successState.cartItems.isNotEmpty){
                return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(productDataModel: successState.cartItems[index], cartBloc: widget.cartBloc, wishlistBloc: widget.wishlistBloc,);
                  },
                );
              }
              else{
                return const Center(
                  child: Text("No Item Founds."),
                );
              }
            default:
              return const Center(
                child: Text("No Item Founds."),
              );
          }
        },
      ),
    );
  }
}
