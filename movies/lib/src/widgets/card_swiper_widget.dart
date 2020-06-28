import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies/src/models/movie_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> moviesList;

  CardSwiper({@required this.moviesList});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          itemCount: moviesList.length,
          itemBuilder: (context, int index) {
            moviesList[index].uniqueId = '${moviesList[index].id}-card';
            return Hero(
              tag: moviesList[index].uniqueId,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'detail',arguments: moviesList[index]),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/loading.gif'),
                      image: NetworkImage(moviesList[index].getPosterImg()),
                      fit: BoxFit.cover,
                    ),
                  )),
            );
          }),
    );
  }
}
