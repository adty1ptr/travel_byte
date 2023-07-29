import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/model.dart';
import '../../shared/theme.dart';
import '../widgets/widget.dart';

class DetailPage extends StatefulWidget {
  final DestinationModel destination;
  const DetailPage({super.key, required this.destination});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DestinationModel destination;
  String backgroundImageUrl = '';

  @override
  void initState() {
    destination = widget.destination;
    backgroundImageUrl = destination.imageUrl;
    // TODO: implement initState
    super.initState();
  }

  Widget backgroundImage(String imageUrl) {
    return Container(
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
          // image: NetworkImage(
          //   destination.imageUrl,
          // ),
        ),
      ),
    );
  }

  Widget customShadow() {
    return Container(
      width: double.infinity,
      height: 214,
      margin: const EdgeInsets.only(top: 236),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            whiteColor.withOpacity(0),
            Colors.black.withOpacity(0.95),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      child: Column(
        children: [
          // NOTE: EMBLEM
          Container(
            width: 108,
            height: 24,
            margin: const EdgeInsets.only(
              top: 30,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon_emblem.png',
                ),
              ),
            ),
          ),

          // NOTE: TITLE
          Container(
            margin: const EdgeInsets.only(top: 256),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.name,
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        destination.city,
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 2),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/icon_star.png',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      destination.rating.toString(),
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE: DESCRIPTION
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE: ABOUT
                Text(
                  'About',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                  style: blackTextStyle.copyWith(
                    height: 2,
                  ),
                ),

                // NOTE: PHOTOS
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Photos',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    PhotoItem(
                      onTap: () {
                        setState(() {
                          backgroundImageUrl =
                              'assets/destinations/image 7.png';
                        });
                      },
                      imageUrl: 'assets/destinations/image 7.png',
                    ),
                    PhotoItem(
                      onTap: () {
                        setState(() {
                          backgroundImageUrl =
                              'assets/destinations/image 8.png';
                        });
                      },
                      imageUrl: 'assets/destinations/image 8.png',
                    ),
                    PhotoItem(
                      onTap: () {
                        setState(() {
                          backgroundImageUrl =
                              'assets/destinations/image 9.png';
                        });
                      },
                      imageUrl: 'assets/destinations/image 9.png',
                    ),
                  ],
                ),

                // NOTE: INTERESTS
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Interests',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Row(
                  children: [
                    InterestItem(
                      text: 'Kids Park',
                    ),
                    InterestItem(
                      text: 'Honor Bridge',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    InterestItem(
                      text: 'City Museum',
                    ),
                    InterestItem(
                      text: 'Central Mall',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE: PRICE & BOOK BUTTON
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                // NOTE: PRICE
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(destination.price),
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'per orang',
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),

                // NOTE: BOOK BUTTON
                CustomButton(
                  title: 'Book Now',
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ChooseSeatPage(destination),
                    //   ),
                    // );
                  },
                  width: 170,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.colorScheme.background,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            (backgroundImageUrl != '')
                ? backgroundImage(backgroundImageUrl)
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
