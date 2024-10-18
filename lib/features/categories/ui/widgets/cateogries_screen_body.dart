import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/features/categories/logic/categories_cubit.dart';
import 'package:mentorship_project/features/categories/logic/categories_state.dart';

import '../../../../core/config/theming/styles.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../cart/logic/cart_cubit.dart';
import '../../../home/data/models/products_model.dart';
import '../../../home/ui/widgets/product_item.dart';
import '../../data/models/cateogory_model.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: TextStyles.font22BlackSemiBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesInitialState) {
              // Trigger loading of categories when the screen is first built
              context.read<CategoriesCubit>().getCategories();
              return Center(child: CircularProgressIndicator());
            } else if (state is CategoriesLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CategoriesErrorState) {
              return Center(child: Text(state.errorMessage));
            } else {
              List<CategoryModel> categories = [];
              String? selectedCategory;
              List<ProductModel>? products;

              if (state is CategoriesLoaded) {
                categories = state.categories;
              } else if (state is CategorySelected) {
                categories = state.categories;
                selectedCategory = state.selectedCategory;
              } else if (state is ProductsLoadingState) {
                categories = state.categories;
                selectedCategory = state.selectedCategory;
              } else if (state is ProductsLoaded) {
                categories = state.categories;
                selectedCategory = state.selectedCategory;
                products = state.products;
              } else if (state is ProductsErrorState) {
                categories = state.categories;
                selectedCategory = state.selectedCategory;
              }

              return Column(
                children: [
                  SizedBox(height: 20),
                  CategoryList(
                    categories: categories,
                    selectedCategory: selectedCategory,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: _buildProductSection(context, state, products),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildProductSection(BuildContext context, CategoriesState state, List<ProductModel>? products) {
    if (state is ProductsLoadingState) {
      return Center(child: CircularProgressIndicator());
    } else if (state is ProductsErrorState) {
      return Center(child: Text(state.errorMessage));
    } else if (products != null) {
      return ProductsGrid(products: products);
    } else {
      return Center(child: Text('Select a category to view products'));
    }
  }

  // Widget _buildProductSection(BuildContext context) {
  //   return Expanded(
  //     child: BlocBuilder<CategoriesCubit, CategoriesState>(
  //       builder: (context, state) {
  //         if (state is ProductsLoadingState) {
  //           return Center(child: CircularProgressIndicator());
  //         } else if (state is ProductsErrorState) {
  //           return Center(child: Text(state.errorMessage));
  //         } else if (state is ProductsLoaded) {
  //           return ProductsGrid(products: state.products);
  //         } else {
  //           return SizedBox.shrink();
  //         }
  //       },
  //     ),
  //   );
  // }
}

class ProductsGrid extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsGrid({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CartCubit>(),
      child: GridView.builder(
        // padding: EdgeInsets.symmetric(horizontal: 24.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 2.5 / 4,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            productModel: products[index],
          );
        },
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
  final String? selectedCategory;

  const CategoryList({
    Key? key,
    required this.categories,
    this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // Evenly spaces the items across the row
        children: categories.map((category) {
          final isSelected = category.name == selectedCategory;
          return GestureDetector(
            onTap: () {
              context.read<CategoriesCubit>().selectCategory(category.name);
              // debugPrint('----------------------${category.name} pressed  ----------------------');
            },
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? ColorsManager.primaryColor : ColorsManager.lightPrimary,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      category.svgPath,
                      width: 30,
                      height: 30,
                      color: isSelected ? ColorsManager.lightPrimary : ColorsManager.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: 70, // Fixed width for the text container
                  height: 30, // Fixed height for the text container
                  alignment: Alignment.center, // Center the text inside the container
                  child: Text(
                    category.name,
                    textAlign: TextAlign.center, // Center-align the text
                    maxLines: 2, // Allow a maximum of 2 lines
                    overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

// class ProductGrid extends StatelessWidget {
//   final List<ProductModel> products;

//   const ProductGrid({
//     Key? key,
//     required this.products,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 0.75,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         final product = products[index];
//         return Card(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Image.network(
//                   product.image,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       product.title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       '\$${product.price.toStringAsFixed(2)}',
//                       style: TextStyle(color: Colors.green),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
