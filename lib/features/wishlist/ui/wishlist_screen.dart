// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/di/dependency_injection.dart';
import 'package:mentorship_project/features/wishlist/logic/cubit/wishlist_cubit.dart';
import 'package:mentorship_project/features/wishlist/ui/widgets/wishlist_screen_body.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<WishlistCubit>()..loadWishlist(),
      child: WishlistScreenBody(),
    );
  }
}
