import 'package:codenest/core/constants/app_icons.dart';
import 'package:codenest/core/constants/app_texts.dart';
import 'package:codenest/core/constants/sizes.dart';
import 'package:codenest/core/widgets/note_tile.dart';
import 'package:codenest/shared/utils/input_decoration_helper.dart';
import 'package:codenest/shared/utils/theme_extensions.dart';
import 'package:codenest/student/controllers/student_saved_notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StudentSavedNotesScreen extends StatelessWidget {
  const StudentSavedNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentSavedNotesController>();

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
          AppTexts.savedNotes,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.paddingWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: inputDecorationHelper(
                  context: context,
                  hint: AppTexts.searchNotesHint,
                  iconPath: AppIcons.search,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppTexts.availableNotes,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  NoteTile(
                    title: "Array Insertion & Deletion Notes",
                    description:
                        "This PDF explains how to insert and delete elements in arrays with examples and diagrams. Includes edge cases and time comple...",
                    tags: "DSA, Arrays, Beginner, Insertion, Deletion, PDF",
                    fileType: "PDF",
                    isBookmarked: false,
                    onSeeAttachments: () {},
                    onBookmarkPressed: () {},
                  ),
                  NoteTile(
                    title: "Normalization Techniques in DBMS",
                    description:
                        "Understand 1NF, 2NF, 3NF with practical table examples. This note simplifies complex normalization topics using relatable analogies.",
                    tags:
                        "DBMS, Normalization, Tables, 1NF, 2NF, 3NF, Beginner, PDF",
                    fileType: "PDF",
                    isBookmarked: true,
                    onSeeAttachments: () {},
                    onBookmarkPressed: () {},
                  ),
                  NoteTile(
                    title: "Array Insertion & Deletion Notes",
                    description:
                        "This PDF explains how to insert and delete elements in arrays with examples and diagrams. Includes edge cases and time comple...",
                    tags: "DSA, Arrays, Beginner, Insertion, Deletion, PDF",
                    fileType: "PDF",
                    isBookmarked: false,
                    onSeeAttachments: () {},
                    onBookmarkPressed: () {},
                  ),
                  NoteTile(
                    title: "Normalization Techniques in DBMS",
                    description:
                        "Understand 1NF, 2NF, 3NF with practical table examples. This note simplifies complex normalization topics using relatable analogies.",
                    tags:
                        "DBMS, Normalization, Tables, 1NF, 2NF, 3NF, Beginner, PDF",
                    fileType: "PDF",
                    isBookmarked: true,
                    onSeeAttachments: () {},
                    onBookmarkPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
