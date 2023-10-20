import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_boutique/api/ftl_client.dart';
import 'package:online_boutique/api/productcatalog.dart';

final productsProvider = StateProvider<List<Product>>((ref) => []);

Future<List<Product>> refreshProducts(WidgetRef ref) async {
  final products = await ProductcatalogClient(ftlClient: FTLHttpClient.instance)
      .list(ListRequest());

  ref.read(productsProvider.notifier).state = products.products;
  return products.products;
}
