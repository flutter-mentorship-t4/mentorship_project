import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/product_shimmer_loading.dart';
import '../../../../core/widgets/products_grid.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current != previous,
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return ProductsGrid(products: state.filteredProducts);
          } else if (state is ProductFailure) {
            return Text('Error //${state.errorMessage}');
          } else {
            return ProductShimmerLoading();
          }
        },
      ),
    );
  }
}
