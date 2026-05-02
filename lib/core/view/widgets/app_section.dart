import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/features/community/presentation/view/pages/community_page.dart';
import 'package:syntra_ai/features/home/presentation/view/pages/home_page.dart';
import 'package:syntra_ai/features/learn/presentation/view/pages/learn_page.dart';
import 'package:syntra_ai/features/profile/presentation/view/pages/profile_page.dart';
import 'package:syntra_ai/generated/l10n.dart';
// import 'package:flutter_svg/svg.dart';

class AppSection extends StatefulWidget {
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  // List<Widget> pages = [
  //   const HomePage(),
  //   const LearnPage(),
  //   const CommunityPage(),
  //   const ProfilePage(),
  // ];

  // int index = 0;

  @override
  Widget build(BuildContext context) {
    // final isLightMode = Theme.of(context).brightness == Brightness.light;
    final List<PersistentTabConfig> tabs = [
      PersistentTabConfig(
        screen: const HomePage(),
        item: ItemConfig(
          activeForegroundColor: AppColors.blue,
          inactiveForegroundColor: AppColors.secondary.withAlpha(170),
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.blue,
          ),
          icon: const Icon(Icons.home),
          title: S.of(context).bottom_nav_bar_title1,
        ),
      ),
      PersistentTabConfig(
        screen: const LearnPage(),
        item: ItemConfig(
          activeForegroundColor: AppColors.blue,
          inactiveForegroundColor: AppColors.secondary.withAlpha(170),
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.blue,
          ),
          icon: const Icon(Icons.school),
          title: S.of(context).bottom_nav_bar_title2,
        ),
      ),
      PersistentTabConfig(
        screen: const SizedBox.shrink(),
        item: ItemConfig(
          activeForegroundColor: AppColors.transparent,
          inactiveForegroundColor: AppColors.transparent,
          icon: const Icon(Icons.add, color: AppColors.transparent),
        ),
      ),
      PersistentTabConfig(
        screen: const CommunityPage(),
        item: ItemConfig(
          activeForegroundColor: AppColors.blue,
          inactiveForegroundColor: AppColors.secondary.withAlpha(170),
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.blue,
          ),
          icon: Icon(Icons.groups, size: 28.sp),
          title: S.of(context).bottom_nav_bar_title3,
        ),
      ),
      PersistentTabConfig(
        screen: const ProfilePage(),
        item: ItemConfig(
          activeForegroundColor: AppColors.blue,
          inactiveForegroundColor: AppColors.secondary.withAlpha(170),
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.blue,
          ),
          icon: const Icon(Icons.person),
          title: S.of(context).bottom_nav_bar_title4,
        ),
      ),
    ];
    return Scaffold(
      body: PersistentTabView(
        // backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
        // backgroundColor: isLightMode ? AppColors.primary : AppColors.dark,
        margin: EdgeInsets.only(top: 6.h),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 0,
          backgroundColor: AppColors.transparent,
          clipBehavior: Clip.antiAlias,
          shape: const CircleBorder(),
          child: Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.1, 0.8],
                colors: [
                  AppColors.blue.withValues(alpha: 170, blue: 120),
                  AppColors.purple.withValues(alpha: 170, blue: 150),
                ],
                transform: const GradientRotation(0.2),
              ),
            ),
            child: const Icon(
              color: AppColors.primary,
              Icons.add,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        tabs: tabs,
        navBarBuilder: (navBarConfig) =>
            Style1BottomNavBar(navBarConfig: navBarConfig),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      // backgroundColor: AppColors.primary,
      // unselectedFontSize: 13,
      // selectedFontSize: 14,
      // selectedItemColor: AppColors.blue,
      // unselectedItemColor: AppColors.secondary.withAlpha(170),
      // type: BottomNavigationBarType.fixed,
      // showSelectedLabels: true,
      // selectedLabelStyle: TextStyle(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 16,
      //   color: AppColors.blue,
      // ),
      // unselectedLabelStyle: TextStyle(
      //   fontWeight: FontWeight.w400,
      //   fontSize: 15,
      //   color: AppColors.secondary.withAlpha(170),
      // ),
      //   currentIndex: index,
      //   onTap: (selectedIndex) {
      //     index = selectedIndex;
      //     setState(() {});
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       // icon: SvgPicture.asset(
      //       //   'assets/icons/icon-home.svg',
      //       //   height: 23,
      //       //   width: 23,
      //       //   fit: BoxFit.cover,
      //       //   color: index == 0 ? Color(0xff212121) : Color(0xff5C5C5C),
      //       // ),
      //       icon: Icon(
      //         Icons.home
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       // icon: SvgPicture.asset(
      //       //   'assets/icons/icon-cart.svg',
      //       //   height: 23,
      //       //   width: 23,
      //       //   fit: BoxFit.cover,
      //       //   color: index == 1 ? Color(0xff212121) : Color(0xff5C5C5C),
      //       // ),
      //       icon: Icon(
      //         Icons.school,
      //       ),
      //       label: 'Learn',
      //     ),
      //     BottomNavigationBarItem(
      //       // icon: SvgPicture.asset(
      //       //   'assets/icons/icon-favourite.svg',
      //       //   height: 23,
      //       //   width: 23,
      //       //   fit: BoxFit.cover,
      //       //   color: index == 2 ? Color(0xff212121) : Color(0xff5C5C5C),
      //       // ),
      //       icon: Icon(
      //         Icons.groups,
      //       ),
      //       label: 'Community',
      //     ),
      //     BottomNavigationBarItem(
      //       // icon: SvgPicture.asset(
      //       //   'assets/icons/icon-profile.svg',
      //       //   height: 23,
      //       //   width: 23,
      //       //   fit: BoxFit.cover,
      //       //   color: index == 3 ? Color(0xff212121) : Color(0xff5C5C5C),
      //       // ),
      //       icon: Icon(
      //         Icons.person,
      //       ),
      //       label: 'Person',
      //     ),
      //   ],
      // ),
      // body: Center(child: pages[index]),
    );
  }
}
