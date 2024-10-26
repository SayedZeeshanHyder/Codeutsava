import 'package:codeutsava/Screens/Movie/NewsScreen.dart';
import 'package:codeutsava/Screens/Movie/SampleScreen.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text(
          'Entertainment',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          tabs: [
            Tab(text: 'Recommend'),
            Tab(text: 'Recent'),
            Tab(text: 'News'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMoviesList(context),
          DashboardScreen(),
          NewsScreen(),
        ],
      ),
    );
  }

  Widget _buildMoviesList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildHighlightedMovie(),
        SizedBox(height: 20),
        _buildMovieCard(context, 'Doctor Strange', 7.2, 'Science fiction, Action', '1h 33min',
            'https://via.placeholder.com/80x120', 4),
        _buildMovieCard(context, 'Marvel Heroes', 7.5, 'Science fiction, Action', '1h 41min',
            'https://via.placeholder.com/80x120', 4),
        _buildMovieCard(context, 'Raytheon', 8.2, 'Science fiction, Action', '2h 15min',
            'https://via.placeholder.com/80x120', 5),
      ],
    );
  }

  Widget _buildHighlightedMovie() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage('https://via.placeholder.com/350x200'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, String title, double rating, String genre, String duration, String imageUrl, int stars) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              title: title,
              rating: rating,
              genre: genre,
              duration: duration,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl, width: 80, height: 120, fit: BoxFit.cover),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Row(
                    children: List.generate(stars, (index) => Icon(Icons.star, color: Colors.blue, size: 16)),
                  ),
                  SizedBox(height: 4),
                  Text('$rating', style: TextStyle(color: Colors.blueGrey)),
                  Text(genre, style: TextStyle(color: Colors.black54)),
                  Text(duration, style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailScreen extends StatelessWidget {
  final String title;
  final double rating;
  final String genre;
  final String duration;
  final String imageUrl;

  MovieDetailScreen({required this.title, required this.rating, required this.genre, required this.duration, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(title, style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(imageUrl, width: 200, height: 300, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: index < rating.floor() ? Colors.blue : Colors.grey,
                  size: 20,
                );
              }),
            ),
            SizedBox(height: 10),
            Text('Genre: $genre', style: TextStyle(color: Colors.black54, fontSize: 16)),
            Text('Duration: $duration', style: TextStyle(color: Colors.black54, fontSize: 16)),
            SizedBox(height: 20),
            Text(
              'Movie Synopsis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
