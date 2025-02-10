import 'package:flutter/material.dart';
import 'package:movie_verse/common/widgets/appbar/app_bar.dart';
import 'package:movie_verse/presentation/home/widgets/category_text.dart';
import 'package:movie_verse/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_verse/presentation/home/widgets/popular_tv.dart';
import 'package:movie_verse/presentation/home/widgets/trending_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        loading: false,
        hideBack: true,
        title: _buildLogo(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CategoryText(title: "Trendings 🔥"),
            TrendingMovies(),
            SizedBox(height: 16,),
            CategoryText(title: "Now Playing"),
            SizedBox(height: 16,),
            NowPlayingMovies(),
            SizedBox(height: 16,),
            CategoryText(title: "Popular TV"),
            SizedBox(height: 16,),
            PopularTv(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Text(
      'Movie Verse',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 32, // Daha büyük boyut
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5, // Harfler arasında geniş aralık
        foreground: Paint()
          ..shader = LinearGradient(
            colors: <Color>[
              Colors.red, // Parlak kırmızı
              Colors.deepOrange, // Derin turuncu
              Colors.orange, // Daha açık turuncu
              Colors.yellow, // Sarıya yakın bir parlaklık
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 70.0)),
        shadows: [
          Shadow(
            offset: Offset(4.0, 4.0),
            blurRadius: 8.0,
            color: Colors.black.withOpacity(0.8), // Yoğun siyah gölge
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
