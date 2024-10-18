part of '../home_screen.dart';

class _ProductsGridView extends StatelessWidget {
  const _ProductsGridView();

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    final wishlistCubit = context.watch<WishlistCubit>();

    return BlocProvider.value(
      value: getIt<CartCubit>(),
      // create: (context) => HomeCubit(getIt(), getIt(), getIt())..getProducts(),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current != previous,
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 2.5 / 4,
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final prod = state.products[index];
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        Routes.productDetailsScreen,
                        arguments: prod,
                      );
                    },
                    child: ProductItem(
                      productModel: prod,
                      CartIcon: cartCubit.isProductInCart(prod)
                          ? AppIcons.cartPlus
                          : AppIcons.cartPlusOutlined,
                      onTapCartIcon: () {
                        cartCubit.toggleCartItem(prod);
                      },
                      favIcon: wishlistCubit.isProductInWishlist(prod)
                          ? AppIcons.heart
                          : AppIcons.heartOutlined,
                      onTapFavIcon: () {
                        wishlistCubit.toggleWishlistItem(prod);
                      },
                    ),
                  );
                },
              ),
            );
          } else if (state is ProductFailure) {
            return Text('Error ${state.errorMessage}');
          } else {
            return CircularProgressIndicator().center();
          }
        },
      ),
    );
  }
}
