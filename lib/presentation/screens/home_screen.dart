import 'package:ecommerce/presentation/products/products_bloc.dart';
import 'package:ecommerce/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load products when the screen is initialized
    context.read<ProductsBloc>().add(const LoadProductsEvent());
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop')),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductsBloc>().add(const LoadProductsEvent());
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                onChanged: (value) {
                  setState(() {}); // Trigger a rebuild to filter products
                },
              ),
            ),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state.status == ProductsStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == ProductsStatus.loaded) {
                  final filteredProducts = state.products?.where((product) {
                    final searchTerm = _searchController.text.toLowerCase();
                    return product.title.toLowerCase().contains(searchTerm);
                  }).toList();
                  final products = state.products ?? [];
                  return Expanded(
                    child: GridView.builder(
                      itemCount: filteredProducts?.length ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                          ),
                      itemBuilder: (context, index) {
                        final product =
                            filteredProducts?[index] ?? products[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailsScreen(product: product),
                              ),
                            );
                          },
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Center(
                                  child: Image.network(
                                    product.image ?? '',
                                    height: 100,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      print(
                                        'Error loading image: $error',
                                      ); // Log the error
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    product.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    '\$${product.price.toStringAsFixed(2)}',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),

                                      onPressed: () {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '${product.title} added to cart',
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text("Add To Cart"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state.status == ProductsStatus.error) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }
                return const Center(child: Text('Welcome to the Home Screen!'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
