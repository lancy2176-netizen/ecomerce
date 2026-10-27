import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/network/api_service.dart';
import 'package:ecommerce/core/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiService apiService;
  ProductsBloc({required this.apiService}) : super(ProductsInitial()) {
    on<LoadProductsEvent>((event, emit) async {
      try {
        emit(ProductsState(status: ProductsStatus.loading));
        final products = await apiService.getProducts();
        print(
          'Products fetched successfully: $products',
        ); // Log the fetched products
        emit(ProductsState(status: ProductsStatus.loaded, products: products));
      } catch (e, stackTrace) {
        print('Error in ProductsBloc: $e');
        print('Stack trace: $stackTrace');
        emit(
          ProductsState(
            status: ProductsStatus.error,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
