import 'package:flutter/material.dart';

import '../../data/models/cart_item_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel item;
  final Function(int) onQuantityChanged;
  final VoidCallback onSelectionChanged;
  final VoidCallback onRemove;

  const CartItemWidget({
    Key? key,
    required this.item,
    required this.onQuantityChanged,
    required this.onSelectionChanged,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Checkbox(
            value: item.isSelected,
            onChanged: (_) => onSelectionChanged(),
          ),
          Image.network(item.product.image, width: 80, height: 80, fit: BoxFit.cover),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.product.title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text('${item.product.price.toStringAsFixed(2)} L.E'),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => onQuantityChanged(item.quantity - 1),
              ),
              Text('${item.quantity}'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => onQuantityChanged(item.quantity + 1),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
