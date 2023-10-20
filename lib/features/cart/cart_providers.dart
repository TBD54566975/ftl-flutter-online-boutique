import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_boutique/api/cart.dart';
import 'package:online_boutique/api/ftl_client.dart';

final cartProvider = StateProvider<Cart>((ref) => Cart(userID: 'a', items: []));
final cartCountProvider = StateProvider<int>(
  (ref) =>
      ref.watch(cartProvider).items.fold(0, (sum, item) => sum + item.quantity),
);

Future<void> refreshCart(WidgetRef ref) async {
  CartClient(ftlClient: FTLHttpClient.instance)
      .getCart(GetCartRequest(userID: 'a'))
      .then((value) {
    ref.read(cartProvider.notifier).state = value;
  });
}

Future<void> emptyCart(WidgetRef ref) async {
  CartClient(ftlClient: FTLHttpClient.instance)
      .emptyCart(EmptyCartRequest(userID: 'a'))
      .then((value) {
    refreshCart(ref);
  });
}
