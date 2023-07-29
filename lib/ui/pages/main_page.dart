import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/cubit.dart';
import '../../shared/theme.dart';
import '../widgets/widget.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'myticket_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const MyTicketPage();
        case 2:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    Widget customBottomNavigation(int currentIndex) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: AdaptiveTheme.of(context)
                .theme
                .bottomNavigationBarTheme
                .backgroundColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                index: 0,
                currIndex: currentIndex,
                imageUrl: 'assets/menu/home.png',
              ),
              CustomBottomNavigationItem(
                index: 1,
                currIndex: currentIndex,
                imageUrl: 'assets/menu/tiket.png',
              ),
              CustomBottomNavigationItem(
                index: 2,
                currIndex: currentIndex,
                imageUrl: 'assets/menu/user.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor:
              AdaptiveTheme.of(context).theme.colorScheme.background,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(currentIndex),
            ],
          ),
        );
      },
    );
  }
}
