import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:home_rent_ui/models/home.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.home});
  final Home home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Gap(20 + MediaQuery.of(context).padding.top),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                buildImage(),
                Positioned.fill(
                  child: buildGradient(),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: buildMainInfo(),
                ),
                Positioned(
                  left: 18,
                  right: 18,
                  top: 18,
                  child: buildHeader(context),
                ),
              ],
            ),
          ),
          const Gap(24),
          buidlDescription(),
          const Gap(24),
          buildOwner(),
          const Gap(30),
          buildGallery(),
          const Gap(30),
          buildMap(),
          const Gap(160),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: buildPrice(),
    );
  }

  Widget buildImage() {
    return Image.asset(
      home.imageRaw,
      width: double.infinity,
      height: 304,
      fit: BoxFit.cover,
    );
  }

  Widget buildGradient() {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.32, 0.76],
          colors: [
            Colors.black.withOpacity(0),
            Colors.black.withOpacity(0.6),
          ],
        ),
      ),
    );
  }

  Widget buildMainInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          home.name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        const Gap(8),
        Text(
          '${home.address}, ${home.city}',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xffD4D4D4),
          ),
        ),
        const Gap(20),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffFFFFFF).withOpacity(0.2),
                    ),
                    child: const ImageIcon(
                      AssetImage('assets/ic_bed.png'),
                      size: 24,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  const Gap(8),
                  Text(
                    '${home.bedroom} Bedroom',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xffD4D4D4),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffFFFFFF).withOpacity(0.2),
                    ),
                    child: const ImageIcon(
                      AssetImage('assets/ic_bath.png'),
                      size: 24,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  const Gap(8),
                  Text(
                    '${home.bathroom} Bathroom',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xffD4D4D4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton.filled(
          onPressed: () => Navigator.pop(context),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.black.withOpacity(0.24),
            ),
          ),
          icon: const ImageIcon(
            AssetImage('assets/ic_nav_back.png'),
            size: 24,
            color: Colors.white,
          ),
        ),
        IconButton.filled(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.black.withOpacity(0.24),
            ),
          ),
          icon: const ImageIcon(
            AssetImage('assets/ic_bookmark.png'),
            size: 24,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buidlDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xff000000),
          ),
        ),
        const Gap(20),
        ReadMoreText(
          home.description,
          trimLength: 100,
          trimExpandedText: ' Show Less',
          trimCollapsedText: ' Show More',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xff858585),
          ),
          lessStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xff0A8ED9),
          ),
          moreStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xff0A8ED9),
          ),
        ),
      ],
    );
  }

  Widget buildOwner() {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            home.profile,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                home.owner,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff000000),
                ),
              ),
              const Text(
                'Owner',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff858585),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            'assets/ic_phone.png',
            'assets/ic_message_filled.png',
          ].map((e) {
            return Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xff0A8ED9).withOpacity(0.5),
              ),
              child: Image.asset(
                e,
                width: 24,
                height: 24,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildGallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gallery',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xff000000),
          ),
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(home.gallery.length, (index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Image.asset(
                    home.gallery[index],
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                  if (index == 3)
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: const Color(0xff000000).withOpacity(0.3),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '+5',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget buildMap() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/map.png',
        width: double.infinity,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildPrice() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.28, 0.62],
          colors: [
            const Color(0xffFFFFFF).withOpacity(0),
            const Color(0xffFFFFFF),
          ],
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Price',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff858585),
                  ),
                ),
                const Gap(8),
                Text(
                  '${NumberFormat.currency(
                    decimalDigits: 0,
                    locale: 'id_ID',
                    symbol: 'Rp. ',
                  ).format(home.price)} / Year',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                stops: [0.14, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffA0DAFB),
                  Color(0xff0A8ED9),
                ],
              ),
            ),
            child: const Text(
              'Rent Now',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
