import 'package:bloc_demo2/home/widget/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart/bloc/cart_bloc.dart';
import '../cart/cart.dart';
import '../wishlist/bloc/wishlist_bloc.dart';
import '../wishlist/wishlist.dart';
import 'bloc/home_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  final CartBloc cartBloc = CartBloc();
  WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    super.initState();

    homeBloc.add(HomeInitialEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Bloc Demo"),
        actions: [
          IconButton(
            onPressed: () {
              homeBloc.add(HomeProductWishlistButtonNavigateEvent());
            },
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              homeBloc.add(HomeProductCartButtonNavigateEvent());
            },
            icon: const Icon(Icons.shopping_cart_checkout),
          ),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is !HomeActionState,
        listener: (BuildContext context, Object? state) {
          if(state is HomeNavigateToCartPageActionState){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(cartBloc: cartBloc, wishlistBloc: wishlistBloc),));
          }else if(state is HomeNavigateToWishlistPageActionState){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlist(wishlistBloc: wishlistBloc,cartBloc: cartBloc),));
          }else if(state is HomeProductItemCartedActionState){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item added to cart.")));
          }else if(state is HomeProductItemWishListedActionState){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item added to wishlist.")));
          }
          else{}
        },
        builder: (BuildContext context, state) {
          switch(state.runtimeType){
            case HomeLoadingState:
              return const Center(child: CircularProgressIndicator(color: Colors.blueGrey));
            case HomeLoadedSuccessState :
              final successState = state as HomeLoadedSuccessState;
              return ListView.builder(
                itemCount: successState.productDataModel.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(productDataModel: successState.productDataModel[index], homeBloc: homeBloc,);
                },
              );
            case HomeErrorState:
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.warning, color: Colors.redAccent, size: 50),
                    Text("Oops!", style: TextStyle(fontSize: 24, color: Colors.red)),
                    Text("Something Went Wrong.", style: TextStyle(fontSize: 16)),
                  ],
                ),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
