import 'package:barber_shop_app/model/product.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final int quantity;
  final Function(Product) onEliminated;

  const ProductWidget({
    super.key,
    required this.product,
    required this.onEliminated,
    this.quantity = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.image,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      ),
      title: Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        'Cant: $quantity • ${product.price.toStringAsFixed(2)} c/u',
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () => onEliminated(product),
      ),
    );
  }
}
