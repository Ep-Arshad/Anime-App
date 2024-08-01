import 'package:anime_world_tutorial/screens/anime_details_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/models/anime.dart';

class TopAnimesImageSlider extends StatefulWidget {
  const TopAnimesImageSlider({
    super.key,
    required this.animes,
  });

  final Iterable<Anime> animes;

  @override
  State<TopAnimesImageSlider> createState() => _TopAnimesImageSliderState();
}

class _TopAnimesImageSliderState extends State<TopAnimesImageSlider> {
  int _currentPageIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Carousel Slider
          CarouselSlider.builder(
            carouselController: _controller,
            itemCount: widget.animes.length,
            itemBuilder: (context, index, realIndex) {
              final anime = widget.animes.elementAt(index);
              return TopAnimePicture(
                anime: anime,
              );
            },
            options: CarouselOptions(
              enlargeFactor: 0.22,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              aspectRatio: 15 / 9,
              viewportFraction: 0.80,
              autoPlay: true,
              enlargeCenterPage: true,
              initialPage: _currentPageIndex,
            ),
          ),

          const SizedBox(height: 10),

          // Page Indicator (commented out, but you can uncomment if you want to use it)
          // AnimatedSmoothIndicator(
          //   activeIndex: _currentPageIndex,
          //   count: widget.animes.length,
          //   effect: CustomizableEffect(
          //     activeDotDecoration: DotDecoration(
          //       borderRadius: BorderRadius.circular(8.0),
          //       color: AppColors.blueColor,
          //       width: 30.0,
          //       height: 5.0,
          //     ),
          //     dotDecoration: DotDecoration(
          //       borderRadius: BorderRadius.circular(8.0),
          //       width: 18.0,
          //       height: 5.0,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class TopAnimePicture extends StatelessWidget {
  const TopAnimePicture({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AnimeDetailsScreen(id: anime.node.id),
              ),
            );
          },
          splashColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                anime.node.mainPicture.medium,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          anime.node.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
