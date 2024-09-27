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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: GridTile(
            header: Row(
              children: [
                AppIconButton(
                  onTap: () {},
                  icon: SvgPicture.asset(
                    AppIcons.heartOutlined,
                    width: 20.w,
                  ),
                  backgroundColor: ColorsManager.greyD9.withOpacity(0.8),
                  vPadding: 10,
                  hPadding: 10,
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
                  backgroundColor: ColorsManager.greyD9.withOpacity(0.8),
                  vPadding: 10,
                  hPadding: 10,
                ).paddingAll(10),
              ],
            ),
            child: Image.asset(
              'assets/images/signature.png',
              fit: BoxFit.cover,
            ),
          ),
        ).expanded(),
        verticalSpace(5),
        Text('Product 1', style: TextStyles.font14BlackRegular),
        Text('\$10.00', style: TextStyles.font12BlackBold),
      ],
    );
  }
}
