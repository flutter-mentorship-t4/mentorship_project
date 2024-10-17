import 'package:flutter/material.dart';

import '../../../../core/config/theming/styles.dart';

class CateogriesScreenBody extends StatelessWidget {
  const CateogriesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: TextStyles.font22BlackSemiBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            //Categories as circle images

            //Products Grid view based on the selected category
          ],
        ),
      ),
    );
  }
}
