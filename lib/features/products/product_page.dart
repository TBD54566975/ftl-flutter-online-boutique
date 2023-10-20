import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_boutique/api/cart.dart';
import 'package:online_boutique/api/ftl_client.dart';
import 'package:online_boutique/api/productcatalog.dart';
import 'package:online_boutique/features/cart/cart_button.dart';
import 'package:online_boutique/features/cart/cart_providers.dart';

class ProductPage extends HookConsumerWidget {
  final Product product;
  const ProductPage({required this.product, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdding = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: const [CartButton()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product.picture,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        children: [
                          Text(
                            'SKU: ${product.id}',
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            product.description,
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8.0,
                            children: product.categories.map((category) {
                              return Chip(
                                label: Text(category),
                                backgroundColor:
                                    Theme.of(context).colorScheme.background,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (isAdding.value)
                const Center(child: CircularProgressIndicator()),
              if (!isAdding.value)
                ElevatedButton(
                  onPressed: () {
                    isAdding.value = true;
                    CartClient(ftlClient: FTLHttpClient.instance)
                        .addItem(AddItemRequest(
                      userID: 'a',
                      item: Item(productID: product.id, quantity: 1),
                    ))
                        .then((value) {
                      isAdding.value = false;
                    });
                    refreshCartCount(ref);
                  },
                  child: const Text('Add to Cart'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
