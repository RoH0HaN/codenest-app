import 'package:codenest/routes/route_names.dart';
import 'package:codenest/shared/bindings/login_binding.dart';
import 'package:codenest/shared/bindings/signup_binding.dart';
import 'package:codenest/shared/screens/login/login_screen.dart';
import 'package:codenest/shared/screens/signup/signup_screen.dart';
import 'package:codenest/student/bindings/student_batch_details_binding.dart';
import 'package:codenest/student/bindings/student_batch_info_binding.dart';
import 'package:codenest/student/bindings/student_blog_details_binding.dart';
import 'package:codenest/student/bindings/student_blogs_binding.dart';
import 'package:codenest/student/bindings/student_curriculums_binding.dart';
import 'package:codenest/student/bindings/student_home_binding.dart';
import 'package:codenest/student/bindings/student_new_batches_binding.dart';
import 'package:codenest/student/bindings/student_notes_binding.dart';
import 'package:codenest/student/bindings/student_notifications_binding.dart';
import 'package:codenest/student/bindings/student_profile_binding.dart';
import 'package:codenest/student/bindings/student_saved_blogs_binding.dart';
import 'package:codenest/student/bindings/student_saved_notes_binding.dart';
import 'package:codenest/student/screens/batch_details/student_batch_details_screen.dart';
import 'package:codenest/student/screens/batch_info/student_batch_info_screen.dart';
import 'package:codenest/student/screens/blog_details/student_blog_details_screen.dart';
import 'package:codenest/student/screens/blogs/student_blogs_screen.dart';
import 'package:codenest/student/screens/curriculums/student_curriculums_screen.dart';
import 'package:codenest/student/screens/home/student_home_screen.dart';
import 'package:codenest/student/screens/new_batches/student_new_batches_screen.dart';
import 'package:codenest/student/screens/notes/student_notes_screen.dart';
import 'package:codenest/student/screens/notifications/student_notifications_screen.dart';
import 'package:codenest/student/screens/saved_blogs/student_saved_blogs_screen.dart';
import 'package:codenest/student/screens/saved_notes/student_saved_notes_screen.dart';
import 'package:codenest/student/screens/student_profile/student_profile_screen.dart';
import 'package:codenest/teacher/bindings/teacher_home_binding.dart';
import 'package:codenest/teacher/screens/home/teacher_home_screen.dart';
import 'package:get/get.dart';

import '../shared/screens/onboarding/onboarding_screen.dart';
import '../shared/screens/splash/splash_screen.dart';

class Routes {
  static final List<GetPage> pages = [
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteNames.onboarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteNames.signup,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),

    // Student Routes
    GetPage(
      name: RouteNames.studentHome,
      page: () => const StudentHomeScreen(),
      binding: StudentHomeBinding(),
    ),
    GetPage(
      name: RouteNames.studentBatchDetails,
      page: () => const StudentBatchDetailsScreen(),
      binding: StudentBatchDetailsBinding(),
    ),
    GetPage(
      name: RouteNames.studentNotes,
      page: () => const StudentNotesScreen(),
      binding: StudentNotesBinding(),
    ),
    GetPage(
      name: RouteNames.studentCurriculums,
      page: () => const StudentCurriculumsScreen(),
      binding: StudentCurriculumsBinding(),
    ),
    GetPage(
      name: RouteNames.studentBlogs,
      page: () => const StudentBlogsScreen(),
      binding: StudentBlogsBinding(),
    ),
    GetPage(
      name: RouteNames.studentNotifications,
      page: () => const StudentNotificationsScreen(),
      binding: StudentNotificationsBinding(),
    ),
    GetPage(
      name: RouteNames.studentBlogDetails,
      page: () => const StudentBlogDetailsScreen(),
      binding: StudentBlogDetailsBinding(),
    ),
    GetPage(
      name: RouteNames.studentSavedBlogs,
      page: () => const StudentSavedBlogsScreen(),
      binding: StudentSavedBlogsBinding(),
    ),
    GetPage(
      name: RouteNames.studentSavedNotes,
      page: () => const StudentSavedNotesScreen(),
      binding: StudentSavedNotesBinding(),
    ),
    GetPage(
      name: RouteNames.studentNewBatches,
      page: () => const StudentNewBatchesScreen(),
      binding: StudentNewBatchesBinding(),
    ),
    GetPage(
      name: RouteNames.studentProfile,
      page: () => const StudentProfileScreen(),
      binding: StudentProfileBinding(),
    ),
    GetPage(
      name: RouteNames.studentBatchInfo,
      page: () => const StudentBatchInfoScreen(),
      binding: StudentBatchInfoBinding(),
    ),

    // Teacher Routes
    GetPage(
      name: RouteNames.teacherHome,
      page: () => const TeacherHomeScreen(),
      binding: TeacherHomeBinding(),
    ),
  ];
}
