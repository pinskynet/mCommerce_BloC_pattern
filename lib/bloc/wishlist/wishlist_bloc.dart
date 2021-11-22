import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pin_shop/model/product_model.dart';
import 'package:pin_shop/model/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());

  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    if (event is StartWishlist) {
      yield* _mapStartWishlistToState();
    } else if (event is AddWishlist) {
      yield* _mapAddWishlistToState(event, state);
    } else if (event is RemoveWishlist) {
      yield* _mapRemoveWishlistToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishlistToState() async* {
    yield WishlistLoading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      yield const WishlistLoaded();
    } catch (_) {}
  }

  Stream<WishlistState> _mapAddWishlistToState(
      AddWishlist event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: WishlistModel(
              products: List.from(state.wishlist.products)..add(event.product)),
        );
      } catch (_) {}
    }
  }

Stream<WishlistState>  _mapRemoveWishlistToState(RemoveWishlist event, WishlistState state) async*{
  if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: WishlistModel(
              products: List.from(state.wishlist.products)..remove(event.product)),
        );
      } catch (_) {}
    }
}

  // WishlistBloc() : super(WishlistInitial()) {
  //   on<WishlistEvent>((event, emit) {
  //   });
  // }
}
