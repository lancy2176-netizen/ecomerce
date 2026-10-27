import 'package:ecommerce/core/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int counter = 1; // Initialize the counter to 1
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Image.network(
              widget.product.image ?? '',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.product.title ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.product.description ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '\$${widget.product.discountPercentage?.toStringAsFixed(2) ?? 'N/A'}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),

          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove, color: Colors.black),
                onPressed: () {
                  setState(() {
                    if (counter > 1) {
                      counter--;
                    }
                  });
                },
              ),
              Text(counter.toString(), style: TextStyle(fontSize: 16)),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: () {
                  setState(() {
                    counter++;
                  });

                  // Handle cart button press
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${widget.product.title} added to cart (Quantity: $counter)',
                      ),
                    ),
                  );
                },
                child: const Text('Add to Cart'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
