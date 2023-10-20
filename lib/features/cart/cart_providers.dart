import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_boutique/api/cart.dart';
import 'package:online_boutique/api/ftl_client.dart';

final cartCountProvider = StateProvider<int>((ref) => 0);

Future<void> refreshCartCount(WidgetRef ref) async {
  CartClient(ftlClient: FTLHttpClient.instance)
      .getCart(GetCartRequest(userID: 'a'))
      .then((value) =>
          ref.read(cartCountProvider.notifier).state = value.items.length);
}
