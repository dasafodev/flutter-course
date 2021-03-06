import 'package:flutter/material.dart';
import 'package:movies/src/models/movie_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Movie> movies;
  final Function nextPage;

  MovieHorizontal({@required this.movies, @required this.nextPage});

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        nextPage();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (context, index) => _card(context, movies[index]),
        // children: _cards(context),
      ),
    );
  }

  Widget _card(BuildContext context, Movie movie) {

    movie.uniqueId = '${movie.id}-horizontal';

    final cardContainer = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: movie.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(movie.getPosterImg()),
                fit: BoxFit.cover,
                height: 120.0,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            movie.originalTitle,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: movie);
      },
      child: cardContainer,
    );
  }

  // Este metodo genera una lista de widgets.Sin embargo, no lo vamos a utilizar ya que
  // ese metodo se usaba en el PageView, pero ahora usaremos PageView.build para mejorar
  // el perfomance de la aplicacion.

  // List<Widget> _cards(BuildContext context) {
  //   return movies.map((e) {
  //     return Container(
  //       margin: EdgeInsets.only(right: 15.0),
  //       child: Column(
  //         children: <Widget>[
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(20.0),
  //             child: FadeInImage(
  //               placeholder: AssetImage('assets/loading.gif'),
  //               image: NetworkImage(e.getPosterImg()),
  //               fit: BoxFit.cover,
  //               height: 120.0,
  //             ),
  //           ),
  //           SizedBox(height: 5.0,),
  //           Text(
  //             e.originalTitle,
  //             overflow: TextOverflow.ellipsis,
  //             style: Theme.of(context).textTheme.caption,
  //           )
  //         ],
  //       ),
  //     );
  //   }).toList();
  // }
}
