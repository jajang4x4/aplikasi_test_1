import 'dart:async';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/restaurant.dart';
import 'restaurant_detail_screen.dart';

class EntryPoint extends StatefulWidget {
  final String city;
  const EntryPoint({super.key, this.city = "San Francisco"});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(city: widget.city),
      const Center(child: Text("Search Screen")),
      const Center(child: Text("Orders Screen")),
      const Center(child: Text("Profile Screen")),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: bodyTextColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String city;
  const HomeScreen({super.key, required this.city});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bannerIndex = 0;
  final PageController _pageController = PageController();
  Timer? _timer;

  // Daftar kategori dengan gambar foto makanan asli
  final categories = [
    {
      "name": "Burger",
      "image": "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&auto=format&fit=crop&q=60"
    },
    {
      "name": "Pizza",
      "image": "https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500&auto=format&fit=crop&q=60"
    },
    {
      "name": "Noodles",
      "image": "https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500&auto=format&fit=crop&q=60"
    },
    {
      "name": "Drinks",
      "image": "https://images.unsplash.com/photo-1551024709-8f23befc6f87?w=500&auto=format&fit=crop&q=60"
    },
    {
      "name": "Dessert",
      "image": "https://images.unsplash.com/photo-1551024709-8f23befc6f87?w=500&auto=format&fit=crop&q=60"
    },
    {
      "name": "Chicken",
      "image": "https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=500&auto=format&fit=crop&q=60"
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _bannerIndex + 1;
        if (nextPage >= demoBanners.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "DELIVERY TO",
              style: TextStyle(color: primaryColor, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.city, style: const TextStyle(color: titleColor, fontSize: 16)),
                const Icon(Icons.keyboard_arrow_down, color: titleColor, size: 20),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Filter", style: TextStyle(color: titleColor, fontSize: 14)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. BANNER PROMOSI GESER OTOMATIS
            SizedBox(
              height: 170,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) => setState(() => _bannerIndex = value),
                    itemCount: demoBanners.length,
                    itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(demoBanners[index], fit: BoxFit.cover, width: double.infinity),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 12,
                    child: Row(
                      children: List.generate(
                        demoBanners.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(left: 4),
                          width: _bannerIndex == index ? 16 : 8,
                          height: 4,
                          decoration: BoxDecoration(
                            color: _bannerIndex == index ? Colors.white : Colors.white54,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 2. KATEGORI MENU DENGAN GAMBAR FOTO ASLI
            const Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: titleColor),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 14),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.network(
                            cat["image"]!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          cat["name"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: titleColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // 3. FEATURED PARTNERS
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured Partners",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: titleColor),
                ),
                Text("See all", style: TextStyle(color: primaryColor, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 235,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: demoPartners.length,
                itemBuilder: (context, index) {
                  final partner = demoPartners[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantDetailScreen(restaurant: partner),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              partner.image,
                              height: 140,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            partner.name,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: titleColor),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            "Colorado, San Francisco",
                            style: TextStyle(color: bodyTextColor, fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  partner.rating.toString(),
                                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text("${partner.deliveryTime} min", style: const TextStyle(fontSize: 12, color: bodyTextColor)),
                              const SizedBox(width: 6),
                              const Text("• Free delivery", style: TextStyle(fontSize: 12, color: bodyTextColor)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}