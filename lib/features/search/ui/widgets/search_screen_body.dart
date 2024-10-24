import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/product_item.dart';
import '../../logic/search_cubit/search_cubit.dart';
import '../../logic/search_cubit/search_state.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: _SearchTextField(),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text('Search Results'),
            SizedBox(height: 16),
            Expanded(child: SearchResultsGrid()),
          ],
        ),
      ),
    );
  }
}

class _SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search products...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      onChanged: (query) {
        context.read<SearchCubit>().searchProducts(query);
      },
    );
  }
}

class SearchResultsGrid extends StatelessWidget {
  const SearchResultsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return switch (state) {
          SearchInitial() => const Center(
              child: Text('Start typing to search...'),
            ),
          SearchLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          SearchSuccess(products: final products) => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductItem(productModel: products[index]);
              },
            ),
          SearchEmpty() => const Center(
              child: Text('No products found'),
            ),
        };
      },
    );
  }
}
