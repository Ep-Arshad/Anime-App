import 'package:anime_world_tutorial/screens/search_screen.dart';
import 'package:anime_world_tutorial/views/featured_animes.dart';
import 'package:anime_world_tutorial/widgets/top_animes_widget.dart';
import 'package:flutter/material.dart';

import '/common/extensions/extensions.dart';
import '/common/utils/utils.dart';

class AnimesScreen extends StatefulWidget {
  const AnimesScreen({super.key});

  @override
  State<AnimesScreen> createState() => _AnimesScreenState();
}

class _AnimesScreenState extends State<AnimesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentSeason = getCurrentSeason().capitalize();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime World', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),),
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SearchScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: const SingleChildScrollView(
          child: Column(
            children: [
              // Top Animes Slider
              const SizedBox(
                height: 280,
                child: TopAnimesList(),
              ),
              Column(
                children: [
                  // Top Ranked animes
                  const SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                      rankingType: 'all',
                      label: 'Top Ranked',
                    ),
                  ),

                  // Top Popular Animes
                  const SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                      rankingType: 'bypopularity',
                      label: 'Top Popular',
                    ),
                  ),

                  // Top Movie Animes
                  const SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                      rankingType: 'movie',
                      label: 'Top Movie Animes',
                    ),
                  ),

                  // Top Upcoming Animes
                  const SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                      rankingType: 'upcoming',
                      label: 'Top Upcoming Animes',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
