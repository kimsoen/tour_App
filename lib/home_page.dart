import 'package:flutter/material.dart';
import 'package:tour_app/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Hi, Kims",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage("assets/profile.png"))),
            ),
          ],
        ),
      );
    }

    Widget populerPlace() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Populer Places",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_list),
              ),
            ],
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PopullerItems(
                  imgUrl: "assets/travel.jpg",
                  title: "Gurun pasir",
                ),
                PopullerItems(
                  imgUrl: "assets/travel1.jpg",
                  title: "tradisional ",
                ),
                PopullerItems(
                  imgUrl: "assets/travel2.jpg",
                  title: "jembatan satapak",
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    }

    Widget content() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Upcoming Places",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_list),
              ),
            ],
          ),
          const Column(
            children: [
              UpcomingItems(
                titleU: "Situ gede",
                state: "Tasikmalaya",
                imgUrlU: "assets/travel3.jpg",
              ),
              UpcomingItems(
                titleU: "Situ gede",
                state: "Tasikmalaya",
                imgUrlU: "assets/travel4.jpg",
              ),
              UpcomingItems(
                titleU: "Situ gede",
                state: "Tasikmalaya",
                imgUrlU: "assets/travel5.jpg",
              ),
            ],
          )
        ],
      );
    }

    return Scaffold(
        body: SafeArea(
            child: ListView(
      padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
      children: [
        header(),
        populerPlace(),
        content(),
      ],
    )));
  }
}

class UpcomingItems extends StatelessWidget {
  const UpcomingItems({
    super.key,
    required this.titleU,
    required this.state,
    required this.imgUrlU,
  });

  final String titleU;
  final String imgUrlU;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(),
                  ));
            },
            child: Container(
              height: 160,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(imgUrlU), fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0x7D3F2A24),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleU,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_city,
                              color: Colors.white,
                            ),
                            Text(
                              state,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopullerItems extends StatelessWidget {
  const PopullerItems({
    super.key,
    required this.imgUrl,
    required this.title,
  });

  final String imgUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(
                    imgUrl,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
