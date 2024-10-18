// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/di/dependency_injection.dart';
import 'package:mentorship_project/core/helpers/extensions/navigations_extensions.dart';
import 'package:mentorship_project/core/helpers/extensions/widgets_extentions.dart';
import 'package:mentorship_project/core/routing/routes.dart';
import 'package:mentorship_project/features/wishlist/logic/cubit/wishlist_cubit.dart';
import 'package:mentorship_project/features/wishlist/logic/cubit/wishlist_state.dart';
import 'package:mentorship_project/features/wishlist/ui/widgets/empty_wishlist.dart';
import 'package:mentorship_project/features/wishlist/ui/widgets/horizontal_listview_wishlist.dart';
import 'package:mentorship_project/features/wishlist/ui/widgets/wishlist_grid_view.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<WishlistCubit>()..emitWishlist(),
      child: Scaffold(
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
                selectedFilterIndex:
                    context.read<WishlistCubit>().selectedFilterIndex,
              ).withHeight(70.h),
              BlocBuilder<WishlistCubit, WishlistState>(
                builder: (context, state) {
                  if (state is WishlistLoadingState) {
                    return Center(child: CircularProgressIndicator().center());
                  } else if (state is WishlistLoadedState) {
                    if (state.items.isEmpty) {
                      return EmptyWishList();
                    } else {
                      return WishlistGridView(items: state.items);
                    }
                  } else if (state is WishlistErrorState) {
                    debugPrint(
                        '----------------------${state.errorMessage} ----------------------');
                    return Center(child: Text('Error: ${state.errorMessage}'));
                  } else {
                    return EmptyWishList();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
