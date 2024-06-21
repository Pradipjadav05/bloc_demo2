
part of 'wishlist_bloc.dart';

abstract class WishlistEvent{}

class WishlistInitialEvent extends WishlistEvent{}

class WishlistItemRemoveEvent extends WishlistEvent{
  final ProductDataModel removeProduct;

  WishlistItemRemoveEvent({required this.removeProduct});
}