import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pin_shop/model/cart_model.dart';
import 'package:pin_shop/model/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  // CartBloc() : super(CartInitial()) {
  //   on<CartEvent>((event, emit) {
  //   });
  // }

  CartBloc() : super(CartLoading());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is StartCart) {
      yield* _mapStartWishlistToState();
    } else if (event is AddCart) {
      yield* _mapAddWishlistToState(event, state);
    } else if (event is RemoveCart) {
      yield* _mapRemoveWishlistToState(event, state);
    }
  }

  Stream<CartState> _mapStartWishlistToState() async* {
    yield CartLoading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      yield const CartLoaded();
    } catch (_) {}
  }

  Stream<CartState> _mapAddWishlistToState(
      AddCart event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
          cart: CartModel(
            products: List.from(state.cart.products)..add(event.product),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<CartState> _mapRemoveWishlistToState(
      RemoveCart event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
          cart: CartModel(
            products: List.from(state.cart.products)..remove(event.product),
          ),
        );
      } catch (_) {}
    }
  }
}
