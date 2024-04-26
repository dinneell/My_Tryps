import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мои поездки',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(0xFFFFFFFF, {
            50: Color(0xFFFFFFFF),
            100: Color(0xFFFFFFFF),
            200: Color(0xFFFFFFFF),
            300: Color(0xFFFFFFFF),
            400: Color(0xFFFFFFFF),
            500: Color(0xFFFFFFFF),
            600: Color(0xFFFFFFFF),
            700: Color(0xFFFFFFFF),
            800: Color(0xFFFFFFFF),
            900: Color(0xFFFFFFFF),
          }),
        ),
      ),
      home: const MyTripsScreen(),
    );
  }
}

class MyTripsScreen extends StatelessWidget {
  const MyTripsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои поездки'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TripStatCard(
                  title: '20.5 км расстояние',
                  backgroundColor: const Color.fromARGB(255, 0, 31, 109),
                ),
                TripStatCard(
                  title: '5 г компенсация выбросов CO2',
                  backgroundColor: Color.fromARGB(255, 241, 150, 12),
                  titleFontSize: 18,
                  titleFontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Вклад в экологию благодаря вашим поездкам:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.eco,
                    size: 24,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Одно дерево может поглотить от 21,77 кг до 31,5 кг СО2 в год. Каждая ваша поездка приближает нас к устойчивому будущему и помогает нам сохранить нашу планету. ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'История поездок:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
            TripHistoryCard(
              date: '30 Апр, 21:15',
              distance: '2919',
              icon: Icons.directions_car,
            ),
            const SizedBox(height: 20),
            TripHistoryCard(
              date: '9 Апр, 11:20',
              distance: '3121',
              backgroundColor: Colors.grey[300],
              icon: Icons.train,
            ),
          ],
        ),
      ),
    );
  }
}

class TripStatCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const TripStatCard({
    required this.title,
    required this.backgroundColor,
    this.titleFontSize = 14,
    this.titleFontWeight = FontWeight.w500,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: titleFontSize,
                fontWeight: titleFontWeight,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class TripHistoryCard extends StatelessWidget {
  final String date;
  final String distance;
  final Color? backgroundColor;
  final IconData? icon;

  const TripHistoryCard({
    required this.date,
    required this.distance,
    this.backgroundColor,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor ?? Colors.grey[200],
      ),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  date,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    if (icon != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(
                          icon,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        distance,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
