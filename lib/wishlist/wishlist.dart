import 'package:bloc_demo2/cart/bloc/cart_bloc.dart';
import 'package:bloc_demo2/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_demo2/wishlist/widget/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  final WishlistBloc wishlistBloc;
  final CartBloc cartBloc;
  const Wishlist({super.key, required this.wishlistBloc, required this.cartBloc});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {


  @override
  void initState() {
    super.initState();
    widget.wishlistBloc.add(WishlistInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist Items"),
        backgroundColor: Colors.blueGrey,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: widget.wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is !WishlistActionState ,
        listener: (context, state) {},
        builder: (context, state) {
          switch(state.runtimeType){
            case WishlistInitialState:
              return const Center(child: CircularProgressIndicator(color: Colors.blueGrey));
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;

              if(successState.wishlistItems.isNotEmpty){
                return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(productDataModel: successState.wishlistItems[index], wishlistBloc: widget.wishlistBloc, cartBloc: widget.cartBloc,);
                  },
                );
              }else{
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
