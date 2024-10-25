import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/widgets/product_shimmer_loading.dart';

import '../../../../core/config/theming/styles.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/products_grid.dart';
import '../../logic/categories_cubit/categories_cubit.dart';
import '../../logic/categories_cubit/categories_state.dart';
import '../../logic/products_cubit/products_cubit.dart';
import '../../logic/products_cubit/products_state.dart';
import 'category_list.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: TextStyles.font22BlackSemiBold),
        centerTitle: true,
      ),
      body: BlocProvider.value(
        value: getIt<ProductsCubit>(),
        child: Column(
          children: [
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CategoriesError) {
                  return Center(child: Text(state.errorMessage));
                } else if (state is CategoriesLoaded) {
                  return CategoryList(
                    categories: state.categories,
                    onCategorySelected: (categoryName) {
                      context.read<ProductsCubit>().loadProductsByCategory(categoryName);
                    },
                  );
                } else {
                  return Center(child: Text('No categories available'));
                }
              },
            ),
            verticalSpace(10),
            Expanded(
              child: BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return ProductShimmerLoading();
                  } else if (state is ProductsError) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is ProductsLoaded) {
                    return ProductsGrid(products: state.products);
                  } else {
                    return Center(child: Text('Select a category to view products'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
