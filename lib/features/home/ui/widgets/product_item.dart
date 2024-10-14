import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorship_project/core/helpers/extensions/navigations_extensions.dart';
import 'package:mentorship_project/core/helpers/extensions/widgets_extentions.dart';
import 'package:mentorship_project/core/routing/routes.dart';

import '../../../../core/config/theming/colors.dart';
import '../../../../core/config/theming/styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/strings/app_icons.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../data/models/products_model.dart';
import '../../logic/home_cubit.dart';

class ProductItem extends StatefulWidget {
  final ProductModel productModel;

  const ProductItem({required this.productModel});

  @override
  State<ProductItem> createState() => ProductItemState();
}

class ProductItemState extends State<ProductItem> {
  late bool isInCart;

  @override
  void initState() {
    super.initState();
    final cartCubit = context.read<HomeCubit>();
    isInCart = cartCubit.isProductInCart(widget.productModel);
  }

  void _toggleCartStatus() {
    final cartCubit = context.read<HomeCubit>();
    cartCubit.toggleAddOrRemoveProductFromCart(widget.productModel);
    setState(() => isInCart = !isInCart);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.productDetailsScreen,
          arguments: widget.productModel,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: GridTile(
              header: Row(
                children: [
                  AppIconButton(
                    onTap: () {},
                    icon: SvgPicture.asset(
                      AppIcons.heartOutlined,
                      width: 20.w,
                    ),
                    width: 32.w,
                    backgroundColor: ColorsManager.greyFC,
                    vPadding: 8.w,
                    hPadding: 8.h,
                  ).paddingAll(10),
                ],
              ),
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppIconButton(
                    onTap: _toggleCartStatus,
                    icon: SvgPicture.asset(
                      isInCart ? AppIcons.cartPlus : AppIcons.cartPlusOutlined,
                      width: 20.w,
                    ),
                    width: 32.w,
                    backgroundColor: ColorsManager.greyFC,
                    vPadding: 8.w,
                    hPadding: 8.h,
                  ).paddingAll(10),
                ],
              ),
              child: Image.network(
                widget.productModel.image,
                fit: BoxFit.cover,
                height: 204.h,
                width: 156.w,
              ),
            ),
          ).expanded(),
          verticalSpace(10),
          Text(
            widget.productModel.title,
            style: TextStyles.font14Grey55Regular,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${widget.productModel.price} \$',
            style: TextStyles.font14BlackRegular,
          ),
        ],
      ),
    );
  }
}
