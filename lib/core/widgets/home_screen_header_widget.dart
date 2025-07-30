import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_images.dart';
import 'package:codenest/core/widgets/square_pill.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreenHeaderWidget extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final String profileRoute;

  const HomeScreenHeaderWidget({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.profileRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(color: context.borderColor),
                      image: const DecorationImage(
                        image: AssetImage(AppImages.imageHint),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                email,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 5),
              SquarePill(
                text: role.toUpperCase(),
                color: context.infoColor,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () => Get.toNamed(profileRoute),
          icon: SvgPicture.asset(
            AppIcons.profileLarge,
            height: 40,
            width: 40,
            colorFilter: ColorFilter.mode(
              context.iconThemeColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
