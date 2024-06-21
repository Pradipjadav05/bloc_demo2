import 'package:bloc_demo2/cart/bloc/cart_bloc.dart';
import 'package:bloc_demo2/data/cart_item.dart';
import 'package:bloc_demo2/home/models/products_data_model.dart';
import 'package:bloc_demo2/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  final CartBloc cartBloc;
  const WishlistTileWidget({super.key, required this.productDataModel, required this.wishlistBloc, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(width: 0.5, color: Colors.blueGrey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 210,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(productDataModel.imageUrl))),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Column(
                  children: [
                    IconButton.outlined(
                      onPressed: (){
                        wishlistBloc.add(WishlistItemRemoveEvent(removeProduct: productDataModel));
                      },
                      icon: const Icon(Icons.favorite, color: Colors.red,),
                    ),
                    IconButton.outlined(
                      onPressed: (){
                        cartBloc.add(CartRemoveFromCartEvent(removeProduct: productDataModel));
                      },
                      icon: Icon(Icons.shopping_cart, color: CartItems.cartItems.contains(productDataModel) ? Colors.red : Colors.blueGrey,),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(productDataModel.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("\$${productDataModel.price}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
            child: Text(productDataModel.description),
          ),
        ],
      ),
    );
  }
}
