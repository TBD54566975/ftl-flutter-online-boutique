import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:online_boutique/models/product.dart';
import 'package:online_boutique/services/product_catalog.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final products = useState<List<Product>>([]);

    useEffect(() {
      isLoading.value = true;
      ProductCatalog().fetchProducts().then((value) {
        products.value = value;
        isLoading.value = false;
      });
      return null;
    }, []);

    if (isLoading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container();
  }
}
