import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_byte/cubit/cubit.dart';
import 'package:travel_byte/shared/theme.dart';

import '../../models/model.dart';
import '../widgets/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget header() {
      return Container(
        // width: size.width,
        // height: size.height * 0.1,
        height: 68,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
        decoration: BoxDecoration(
          color: AdaptiveTheme.of(context).theme.appBarTheme.backgroundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(defaultRadius),
            bottomRight: Radius.circular(defaultRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Datang,",
                  style: AdaptiveTheme.of(context).theme.textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                  if (state is AuthSuccess) {
                    return Text(
                      state.user.name,
                      style: AdaptiveTheme.of(context)
                          .theme
                          .textTheme
                          .headlineMedium,
                    );
                  } else {
                    return Text(
                      "Yuk liburan!",
                      style: AdaptiveTheme.of(context)
                          .theme
                          .textTheme
                          .headlineMedium,
                    );
                  }
                }),
              ],
            ),
          ],
        ),
      );
    }

    Widget cardTicket() {
      return Container(
        width: 360,
        height: 208,
        color: AdaptiveTheme.of(context).theme.cardTheme.surfaceTintColor,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Stack(
            children: [
              Container(
                height: 160,
                color: AdaptiveTheme.of(context).theme.cardTheme.color,
              ),
              Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    child: Container(
                      width: size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: defaultMargin + 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            color: AdaptiveTheme.of(context)
                                .theme
                                .scaffoldBackgroundColor,
                            padding: EdgeInsets.all(defaultMargin / 8),
                            child: Image.asset(
                              "assets/logo-transparent.png",
                              height: 18,
                            ),
                          ),
                          Text(
                            "Tiket kamu kosong nih ...",
                            style: AdaptiveTheme.of(context)
                                .theme
                                .textTheme
                                .titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SeparatorLine(color: Colors.grey),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin + 5),
                    height: 59,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Beli tiket sekarang",
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .labelMedium,
                        ),
                        FillButton(onPress: () {}, text: "Beli tiket"),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: -18,
                bottom: 39,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AdaptiveTheme.of(context)
                        .theme
                        .cardTheme
                        .surfaceTintColor,
                  ),
                ),
              ),
              Positioned(
                right: -18,
                bottom: 39,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AdaptiveTheme.of(context)
                        .theme
                        .cardTheme
                        .surfaceTintColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget bufferBottomNav() {
      return const SizedBox(
        height: 65,
      );
    }

    Widget popularDestinations(List<DestinationModel> lists) {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: lists.map((DestinationModel destination) {
              return DestinationCard(destination: destination);
            }).toList(),
          ),
        ),
      );
    }

    Widget newDestinations(List<DestinationModel> lists) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Column(
              children: lists.map((DestinationModel destination) {
                return DestinationTile(destination: destination);
              }).toList(),
            ),
          ],
        ),
      );
    }

    Widget mainContent() {
      return Container(
          height: size.height - 68,
          decoration: BoxDecoration(
            color: AdaptiveTheme.of(context).theme.colorScheme.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultRadius),
              topRight: Radius.circular(defaultRadius),
            ),
          ),
          child: ListView(
            children: [
              cardTicket(),
              BlocConsumer<DestinationCubit, DestinationState>(
                listener: (context, state) {
                  if (state is DestinationFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: kRedColor,
                        content: Text(state.error),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is DestinationSuccess) {
                    return Column(
                      children: [
                        popularDestinations(state.destinations),
                        newDestinations(state.destinations),
                      ],
                    );
                  }
                  return Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
              ),
              bufferBottomNav(),
            ],
          ));
    }

    return Container(
      color: AdaptiveTheme.of(context).theme.scaffoldBackgroundColor,
      child: ListView(
        children: [
          header(),
          // cardTicket(),
          mainContent(),
        ],
      ),
    );
  }
}
