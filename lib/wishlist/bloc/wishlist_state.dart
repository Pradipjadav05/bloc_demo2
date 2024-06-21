
part of 'wishlist_bloc.dart';
abstract class WishlistState{}

abstract class WishlistActionState extends WishlistState{}

class WishlistInitialState extends WishlistState{}

class WishlistSuccessState extends WishlistState{
  List<ProductDataModel> wishlistItems = [];

  WishlistSuccessState({required this.wishlistItems});
}