import 'package:flutter/material.dart';

import 'blog_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedNav = 0;

  static const menuTabs = [
    'Beranda',
    'Toko',
    'Mulai Jualan',
    'Blog',
    'Tentang Kami',
  ];

  static const bottomItems = [
    ('Beranda', Icons.home_rounded),
    ('Toko', Icons.sell_outlined),
    ('Mulai Berjualan', Icons.storefront_outlined),
    ('Blog', Icons.article_outlined),
    ('Tentang Kami', Icons.info_outline_rounded),
  ];

  static const categories = [
    _CategoryData('Benih Sayuran', '1 Produk', Color(0xFF0C8F53), Icons.eco),
    _CategoryData(
      'Benih Buah',
      '3 Produk',
      Color(0xFFE1B61B),
      Icons.local_florist,
    ),
    _CategoryData('Benih Padi', '2 Produk', Color(0xFFD2BD7A), Icons.grass),
    _CategoryData(
      'Benih Bumbu',
      '2 Produk',
      Color(0xFF5A8B1A),
      Icons.spa_outlined,
    ),
    _CategoryData(
      'Benih Umbi',
      '1 Produk',
      Color(0xFF8DAA1A),
      Icons.agriculture,
    ),
    _CategoryData(
      'Benih Herbal',
      '1 Produk',
      Color(0xFFC5AA31),
      Icons.energy_savings_leaf,
    ),
  ];

  static const products = [
    _ProductData('Benih Kubis', 'Rp10.000', 4.8, Color(0xFF0C8F53)),
    _ProductData('Benih Kangkung', 'Rp8.000', 4.8, Color(0xFFC5D943)),
    _ProductData('Benih Sawi', 'Rp14.000', 4.6, Color(0xFF86B93E)),
    _ProductData('Benih Bayam', 'Rp12.000', 4.9, Color(0xFFE1B61B)),
  ];

  static const bestChips = [
    'Benih Sayuran',
    'Benih Buah',
    'Benih Bunga',
    'Benih Herbal',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: selectedNav == 3 ? const BlogPage() : _homeContent(),
            ),
            _bottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _homeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topBar(),
          _topTabs(),
          _heroBanner(),
          const SizedBox(height: 2),
          _sectionTitle('Belanja Berdasarkan Kategori'),
          _categoryGrid(),
          const SizedBox(height: 18),
          _sectionTitle('Rekomendasi Benih Berkualitas'),
          _productRow(products),
          const SizedBox(height: 8),
          _headline(),
          _benefits(),
          _bestSeedHeader(),
          _bestSeedChips(),
          const SizedBox(height: 12),
          _productRow(products.reversed.toList()),
          _footer(),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 8),
      child: Row(
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              children: [
                TextSpan(
                  text: 'FLO',
                  style: TextStyle(color: Color(0xFF0B8F55)),
                ),
                TextSpan(
                  text: 'M',
                  style: TextStyle(color: Color(0xFF8CC63F)),
                ),
                TextSpan(
                  text: 'ART',
                  style: TextStyle(color: Color(0xFF0B8F55)),
                ),
              ],
            ),
          ),
          const Spacer(),
          ...[
            Icons.chat_bubble_outline_rounded,
            Icons.shopping_bag_outlined,
            Icons.notifications_none_rounded,
            Icons.person_outline_rounded,
          ].map(
            (icon) => Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFDCE5DA)),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, size: 16, color: const Color(0xFF0B8F55)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topTabs() {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final active = index == 0;
          return Column(
            children: [
              Text(
                menuTabs[index],
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                  color: const Color(0xFF2C2E2E),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: active ? 24 : 0,
                height: 3,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0B92A),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemCount: menuTabs.length,
      ),
    );
  }

  Widget _heroBanner() {
    return Container(
      height: 176,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFFF1F8D7), Color(0xFFDCEFA8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              child: CustomPaint(
                size: const Size(double.infinity, 26),
                painter: _BannerPainter(),
              ),
            ),
          ),
          Positioned(
            left: -34,
            top: 22,
            child: Container(
              width: 76,
              height: 76,
              decoration: const BoxDecoration(
                color: Color(0xFF8FD23D),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: -8,
            bottom: 10,
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: Color(0xFFCBE36A),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Belanja Pintar\nuntuk Masa Depan\nyang Lebih Hijau',
                      style: TextStyle(
                        fontSize: 22,
                        height: 1.08,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2B2D2D),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Temukan benih tanaman terbaik dengan proses belanja yang mudah dan efisien.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF67706B),
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xFFE0B92A),
                        foregroundColor: const Color(0xFF2D2D2D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        'Belanja',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const _FarmerArt(),
            ],
          ),
          const Positioned(
            right: 14,
            bottom: 4,
            child: Row(
              children: [
                Icon(Icons.circle, size: 6, color: Colors.white),
                SizedBox(width: 4),
                Icon(Icons.circle, size: 6, color: Colors.white54),
                SizedBox(width: 4),
                Icon(Icons.circle, size: 6, color: Colors.white54),
                SizedBox(width: 4),
                Icon(Icons.circle, size: 6, color: Colors.white54),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF242827),
              ),
            ),
          ),
          const Text(
            'Lihat Semua',
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF646B67),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.17,
        ),
        itemBuilder: (context, index) {
          final item = categories[index];
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -8,
                  top: 18,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.16),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(item.icon, color: Colors.white, size: 28),
                    ),
                    const Spacer(),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 11,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        item.total,
                        style: const TextStyle(
                          fontSize: 9,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _productRow(List<_ProductData> items) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _ProductCard(data: items[index]),
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: items.length,
      ),
    );
  }

  Widget _headline() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(18, 8, 18, 18),
      child: Center(
        child: Text(
          'Kita Menyediakan kamu\nBenih Yang Terbaik',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            height: 1.15,
            fontWeight: FontWeight.w800,
            color: Color(0xFF2A2A2A),
          ),
        ),
      ),
    );
  }

  Widget _benefits() {
    final items = [
      (
        'Benih Tepat Guna',
        'Bibit tanaman sehat, mudah tumbuh untuk hasil terbaik',
        Icons.spa_outlined,
      ),
      (
        'Pengiriman Aman',
        'Pengemasan aman menjaga kualitas selama pengiriman',
        Icons.local_shipping_outlined,
      ),
      (
        'Kualitas Terjamin',
        'Produk tersedia berkualitas dan terpercaya',
        Icons.verified_outlined,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 24),
      child: Row(
        children: items
            .map(
              (item) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0B8F55),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Icon(item.$3, color: Colors.white, size: 28),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.$1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.$2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF6F7671),
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _bestSeedHeader() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Pilihan Benih Terbaik',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            'Lihat Semua',
            style: TextStyle(fontSize: 11, color: Color(0xFF646B67)),
          ),
        ],
      ),
    );
  }

  Widget _bestSeedChips() {
    return SizedBox(
      height: 34,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final active = index == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: active ? const Color(0xFF0B8F55) : Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFD8E2D3)),
            ),
            child: Text(
              bestChips[index],
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: active ? Colors.white : const Color(0xFF55615A),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: bestChips.length,
      ),
    );
  }

  Widget _footer() {
    Widget col(String title, List<String> items) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFFD8F1E3),
                    height: 1.3,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 18),
      width: double.infinity,
      color: const Color(0xFF0B8F55),
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              children: [
                TextSpan(
                  text: 'FLO',
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: 'M',
                  style: TextStyle(color: Color(0xFFBFE869)),
                ),
                TextSpan(
                  text: 'ART',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Mari hijaukan tanaman yang sehat\nuntuk masa depan yang lebih baik',
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFFD8F1E3),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              col('Layanan', [
                'Belanja Tanaman',
                'Benih Murah',
                'Filter Kecocokan',
                'Start Seller Up',
              ]),
              const SizedBox(width: 12),
              col('Bantuan', [
                'Cara Belanja',
                'Cara Menjual',
                'Pengiriman',
                'Kebijakan',
              ]),
              const SizedBox(width: 12),
              col('Ikuti Kami', ['@Flomart.id', '/Flomart.id', '@Flomart.id']),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Copyright 2025 PT. All rights reserved.',
            style: TextStyle(fontSize: 9, color: Color(0xFFD8F1E3)),
          ),
        ],
      ),
    );
  }

  Widget _bottomNav() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(bottomItems.length, (index) {
          final item = bottomItems[index];
          final active = selectedNav == index;
          return InkWell(
            onTap: () => setState(() => selectedNav = index),
            child: SizedBox(
              width: 72,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.$2,
                    size: active ? 34 : 31,
                    color: active
                        ? const Color(0xFF0B8F55)
                        : const Color(0xFF1F2523),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.$1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                      color: active
                          ? const Color(0xFF0B8F55)
                          : const Color(0xFF1F2523),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.data});

  final _ProductData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 64,
              decoration: BoxDecoration(
                color: data.color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            size: 10,
                            color: Color(0xFFE0B92A),
                          ),
                          Text(
                            '${data.rating}',
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.eco_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              data.title,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    data.price,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0B92A),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 13,
                    color: Color(0xFF2B2D2D),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FarmerArt extends StatelessWidget {
  const _FarmerArt();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 16,
            child: Container(
              width: 82,
              height: 82,
              decoration: const BoxDecoration(
                color: Color(0xFFD9E9A2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 6,
            child: Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: Color(0xFFEAAF73),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 62,
              height: 20,
              decoration: BoxDecoration(
                color: const Color(0xFF86572E),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Positioned(
            top: 32,
            child: Container(
              width: 78,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFF768B4D),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.agriculture_rounded,
                size: 34,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            child: Container(
              width: 96,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFFD3A04C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.energy_savings_leaf,
                    size: 15,
                    color: Color(0xFF2F8B45),
                  ),
                  Icon(
                    Icons.energy_savings_leaf,
                    size: 15,
                    color: Color(0xFF2F8B45),
                  ),
                  Icon(
                    Icons.energy_savings_leaf,
                    size: 15,
                    color: Color(0xFF2F8B45),
                  ),
                  Icon(
                    Icons.energy_savings_leaf,
                    size: 15,
                    color: Color(0xFF2F8B45),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BannerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF8FD23D);
    final path = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
        size.width * 0.18,
        2,
        size.width * 0.34,
        size.height * 0.82,
      )
      ..quadraticBezierTo(
        size.width * 0.52,
        size.height * 1.2,
        size.width * 0.7,
        size.height * 0.55,
      )
      ..quadraticBezierTo(size.width * 0.88, 1, size.width, size.height * 0.78)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CategoryData {
  const _CategoryData(this.title, this.total, this.color, this.icon);

  final String title;
  final String total;
  final Color color;
  final IconData icon;
}

class _ProductData {
  const _ProductData(this.title, this.price, this.rating, this.color);

  final String title;
  final String price;
  final double rating;
  final Color color;
}
