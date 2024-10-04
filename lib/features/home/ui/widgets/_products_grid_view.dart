part of '../home_screen.dart';

class _ProductsGridView extends StatelessWidget {
  const _ProductsGridView();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 2.5 / 4,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const _ProductItem();
        },
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.productDetailsScreen);
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
                    onTap: () {},
                    icon: SvgPicture.asset(
                      AppIcons.cartPlus,
                      width: 20.w,
                    ),
                    width: 32.w,
                    backgroundColor: ColorsManager.greyFC,
                    vPadding: 8.w,
                    hPadding: 8.h,
                  ).paddingAll(10),
                ],
              ),
              child: Image.asset(
                'assets/images/signature.png',
                fit: BoxFit.cover,
              ),
            ),
          ).expanded(),
          verticalSpace(10),
          Text('Baby blue blouse', style: TextStyles.font14Grey55Regular),
          Text('545 \$', style: TextStyles.font14BlackRegular),
        ],
      ),
    );
  }
}
