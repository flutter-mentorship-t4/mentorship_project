part of '../home_screen.dart';

class _ProductsGridView extends StatelessWidget {
  const _ProductsGridView();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<HomeCubit>(),
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
                  return ProductItem(
                    productModel: state.products[index],
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
