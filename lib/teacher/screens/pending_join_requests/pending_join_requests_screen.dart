import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/custom_button.dart';
import 'package:codenest/core/widgets/pill_tag.dart';
import 'package:codenest/core/widgets/square_pill.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:codenest/teacher/controllers/pending_join_requests_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/grouped_join_requests_model.dart';

class PendingJoinRequestsScreen extends StatelessWidget {
  const PendingJoinRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PendingJoinRequestsController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcons.back,
            colorFilter:
                ColorFilter.mode(context.iconThemeColor, BlendMode.srcIn),
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          AppTexts.pendingJoinRequests,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.paddingWidth),
        itemCount: controller.testData.length,
        itemBuilder: (context, index) {
          final batchGroup = controller.testData[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BatchHeader(batchGroup: batchGroup),
              ...batchGroup.requests.map((r) => _RequestCard(request: r)),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

class _BatchHeader extends StatelessWidget {
  final BatchJoinRequestGroup batchGroup;
  const _BatchHeader({required this.batchGroup});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          batchGroup.batchName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          batchGroup.batchDescription,
          style: Theme.of(context).textTheme.labelLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _DateTag(
              date: batchGroup.startDate,
              color: context.successColor,
            ),
            const SizedBox(width: 10),
            _DateTag(
              date: batchGroup.endDate,
              color: context.errorColor,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _DateTag extends StatelessWidget {
  final DateTime date;
  final Color color;
  const _DateTag({required this.date, required this.color});

  @override
  Widget build(BuildContext context) {
    final formatted = DateFormat("d MMM, yy").format(date);
    return SquarePill(
      text: formatted,
      color: color,
    );
  }
}

class _RequestCard extends StatelessWidget {
  final PendingJoinRequest request;
  const _RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade900,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.cardPaddingWidth,
          vertical: Sizes.cardPaddingHeight,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    request.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    request.email,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    request.phone,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  text: "Accept",
                  onPressed: () {},
                  type: ButtonType.success,
                ),
                AppButton(
                  text: "Reject",
                  onPressed: () {},
                  type: ButtonType.error,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
