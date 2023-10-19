import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_boutique/features/cart/cart_checkout_page.dart';
import 'package:online_boutique/features/cart/cart_providers.dart';

class CartPage extends HookConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartCount = ref.watch(cartCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: cartCount > 0
                    ? Text('You have $cartCount items in your cart.')
                    : const Text('Your cart is empty.'),
              ),
            ),
            ElevatedButton(
              onPressed: () => ref.read(cartCountProvider.notifier).state = 0,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              ),
              child: const Text('Empty Cart'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartCheckoutPage()),
              ),
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
