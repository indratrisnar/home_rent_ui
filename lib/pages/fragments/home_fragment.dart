import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:badges/badges.dart' as badges;
import 'package:home_rent_ui/models/home.dart';
import 'package:intl/intl.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  String selectedCategory = 'House';
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Gap(24 + MediaQuery.of(context).padding.top),
        buildHeader(),
        const Gap(20),
        buildSearch(),
        const Gap(20),
        buildCategories(),
        const Gap(30),
        buildNearFromYou(),
        const Gap(30),
        buildBestForYou(),
      ],
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff838383),
                  ),
                ),
                const Gap(8),
                Row(
                  children: [
                    const Text(
                      'Jakarta',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xff000000),
                      ),
                    ),
                    const Gap(4),
                    Image.asset(
                      'assets/ic_nav_down.png',
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
          badges.Badge(
            position: badges.BadgePosition.topEnd(
              end: 3,
              top: 3,
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Color(0xffFA0E0E),
              padding: EdgeInsets.all(4),
            ),
            child: const ImageIcon(
              AssetImage('assets/ic_notification.png'),
              size: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF7F7F7),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset(
                    'assets/ic_search.png',
                    height: 24,
                    width: 24,
                  ),
                  const Gap(8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                        hintText: 'Search address, or near you ',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff858585),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(16),
          Container(
            width: 48,
            height: 48,
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
            alignment: Alignment.center,
            child: Image.asset(
              'assets/ic_filter.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategories() {
    final list = [
      'House',
      'Apartment',
      'Hotel',
      'Villa',
      'Cottage',
    ];
    return SizedBox(
      height: 34,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          String category = list[index];
          bool isActive = selectedCategory == category;
          return GestureDetector(
            onTap: () {
              selectedCategory = category;
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.only(
                left: index == 0 ? 20 : 10,
                right: index == list.length - 1 ? 20 : 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isActive ? null : const Color(0xffF7F7F7),
                gradient: isActive
                    ? const LinearGradient(
                        stops: [0.14, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffA0DAFB),
                          Color(0xff0A8ED9),
                        ],
                      )
                    : null,
              ),
              alignment: Alignment.center,
              child: Text(
                category,
                style: TextStyle(
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 12,
                  color: Color(isActive ? 0xffFFFFFF : 0xff858585),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildNearFromYou() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Near from you',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff000000),
                ),
              ),
              Text(
                'See more',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff858585),
                ),
              ),
            ],
          ),
        ),
        const Gap(24),
        SizedBox(
          height: 272,
          child: ListView.builder(
            itemCount: listNearHome.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Home home = listNearHome[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 10,
                  right: index == listNearHome.length - 1 ? 20 : 10,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: home);
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          home.imageCover,
                          fit: BoxFit.cover,
                          width: 222,
                          height: 272,
                        ),
                      ),
                      Container(
                        width: 222,
                        height: 272,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            stops: const [0.38, 1],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xff0D0D0D).withOpacity(0),
                              const Color(0xff000000).withOpacity(0.8),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              home.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                            const Gap(6),
                            Text(
                              home.address,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xffD7D7D7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(8, 4, 10, 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff000000).withOpacity(0.24),
                          ),
                          child: const Row(
                            children: [
                              ImageIcon(
                                AssetImage('assets/ic_location.png'),
                                size: 16,
                                color: Colors.white,
                              ),
                              Gap(4),
                              Text(
                                '1.8 km',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildBestForYou() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best for you',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff000000),
                ),
              ),
              Text(
                'See more',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff858585),
                ),
              ),
            ],
          ),
        ),
        const Gap(24),
        ListView.builder(
          itemCount: listBestHome.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context, index) {
            Home home = listBestHome[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: home);
              },
              child: Container(
                color: Colors.transparent,
                margin: const EdgeInsets.only(bottom: 24),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        home.imageCover,
                        width: 74,
                        height: 70,
                      ),
                    ),
                    const Gap(24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            home.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          ),
                          const Gap(4),
                          Text(
                            '${NumberFormat.currency(
                              decimalDigits: 0,
                              locale: 'id_ID',
                              symbol: 'Rp. ',
                            ).format(home.price)} / Year',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xff0A8ED9),
                            ),
                          ),
                          const Gap(4),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const ImageIcon(
                                      AssetImage('assets/ic_bed.png'),
                                      size: 24,
                                      color: Color(0xff858585),
                                    ),
                                    const Gap(8),
                                    Text(
                                      '${home.bedroom} Bedroom',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xff858585),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    const ImageIcon(
                                      AssetImage('assets/ic_bath.png'),
                                      size: 24,
                                      color: Color(0xff858585),
                                    ),
                                    const Gap(8),
                                    Text(
                                      '${home.bathroom} Bathroom',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xff858585),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
