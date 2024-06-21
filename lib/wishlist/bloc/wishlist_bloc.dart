import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo2/data/wishlist_item.dart';

import '../../home/models/products_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitialState()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistItemRemoveEvent>(wishlistItemRemoveEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: WishlistItem.wishlistListItem));
  }

  FutureOr<void> wishlistItemRemoveEvent(WishlistItemRemoveEvent event, Emitter<WishlistState> emit) {
    WishlistItem.wishlistListItem.remove(event.removeProduct);
    emit(WishlistSuccessState(wishlistItems: WishlistItem.wishlistListItem));
  }
}