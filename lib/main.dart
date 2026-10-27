import 'package:ecommerce/core/network/api_service.dart';
import 'package:ecommerce/presentation/products/products_bloc.dart';
import 'package:ecommerce/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(apiService: ApiService()),
      child: MaterialApp(
        title: 'Flutter Demo',
        // 2. Configure the light theme

        home: HomeScreen(),
      ),
    );
  }
}
