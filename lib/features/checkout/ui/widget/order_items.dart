import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order Items", style: TextStyles.font18blackBold),
        verticalSpace(8),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    width: 80.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://s3-alpha-sig.figma.com/img/ff0f/4061/4ad6b6e9b84d980459576e4d2e5dacea?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jujKOZ8F-OA6GEuXotKuvslTU-yj71QEHMM3t8hM0SwPSVZAQhdoxWGLXgp3SY4mwYrdr~vZQCOfWncH65i5s3BvUrxLjExvkOuWUSyUoVCoWP05Wftidn2co14JQEc8fEeLF~t8HCWEJZDDC57l~DVRQ7~i1z-0i~OSUbBLsm21CkY2BIZBd~28b5v2OfD1kYOeY4mje50uu9T1ytrKEoM9~VgaWGUIov2T0oSEUAuOvrlGaripeTuuBcgAKMFRgMpzKE6vO9--LzOEXsoK2knNa1tkeTG-InhVCG1BDoMO8n6xuoXFNcPf3WsuqYKLmD1sJT52RPgJz-wTirccFg__',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpace(10),
                  Text('580 L.E', style: TextStyles.font16BlackSemiBold),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
