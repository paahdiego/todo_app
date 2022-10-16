import 'package:flutter/material.dart';
import 'package:todo_app/modules/core/app_network_images.dart';
import 'package:todo_app/shared/components/image_network_builder.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 80,
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(500)),
        child: ImageNetworkBuilder(
          AppNetworkImages.userIcon,
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}
