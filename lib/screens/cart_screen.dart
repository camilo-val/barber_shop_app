import 'package:barber_shop_app/providers/carts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Carrito')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: cart.items.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final item = cart.items[i];
                return ListTile(
                  leading: Image.network(
                    item.product.image,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    item.product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    'Cant: ${item.quantity} • ${item.product.price.toStringAsFixed(2)} c/u',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => cart.remove(item.product),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: \$${cart.total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed:
                      cart.items.isEmpty
                          ? null
                          : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Checkout simulado'),
                              ),
                            );
                            cart.clear();
                          },
                  child: const Text('Pagar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
