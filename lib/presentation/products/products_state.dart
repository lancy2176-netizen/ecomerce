part of 'products_bloc.dart';

enum ProductsStatus { initial, loading, loaded, error }

class ProductsState extends Equatable {
  final ProductsStatus status;
  final List<Product>? products;
  final String errorMessage;
  const ProductsState({
    this.status = ProductsStatus.initial,
    this.products,
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [status, products, errorMessage];
}

final class ProductsInitial extends ProductsState {}
