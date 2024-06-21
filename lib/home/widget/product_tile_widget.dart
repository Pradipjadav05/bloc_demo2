import 'package:bloc_demo2/data/cart_item.dart';
import 'package:bloc_demo2/data/wishlist_item.dart';
import 'package:bloc_demo2/home/bloc/home_bloc.dart';
import 'package:bloc_demo2/home/models/products_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

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
                        homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productDataModel));
                      },
                      icon: Icon(Icons.favorite, color: WishlistItem.wishlistListItem.contains(productDataModel) ? Colors.red : Colors.blueGrey,),
                    ),
                    IconButton.outlined(
                      onPressed: (){
                        homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productDataModel));
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
