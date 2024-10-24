import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theming/colors.dart';
import '../../../../core/config/theming/styles.dart';
import '../../../../core/helpers/extensions/navigations_extensions.dart';
import '../../../../core/helpers/extensions/widgets_extentions.dart';
import '../../../../core/routing/routes.dart';
import '../../logic/cubit/wishlist_cubit.dart';
import '../../logic/cubit/wishlist_state.dart';
import 'empty_wishlist.dart';
import 'horizontal_listview_wishlist.dart';
import 'wishlist_grid_view.dart';

class WishlistScreenBody extends StatelessWidget {
  const WishlistScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        title: Text('WishList', style: TextStyles.font22BlackSemiBold),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pushNamed(Routes.navigationScreen),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            HorizontalListViewWishList(
              filterCat: context.read<WishlistCubit>().filterCat,
              selectedFilterIndex: context.read<WishlistCubit>().selectedFilterIndex,
            ).withHeight(70.h),
            BlocBuilder<WishlistCubit, WishlistState>(
              builder: (context, state) {
                if (state is WishlistLoading) {
                  return Center(child: CircularProgressIndicator().center());
                } else if (state is WishlistLoaded) {
                  if (state.items.isEmpty) {
                    return EmptyWishList();
                  } else {
                    return Expanded(child: WishlistGridView(products: state.items));
                  }
                } else if (state is WishlistError) {
                  // debugPrint('----------------------${state.errorMessage} ----------------------');
                  return Center(child: Text('Error: ${state.errorMessage}'));
                } else {
                  return EmptyWishList();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
