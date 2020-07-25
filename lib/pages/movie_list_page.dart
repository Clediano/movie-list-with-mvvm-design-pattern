import 'package:flutter/material.dart';
import 'package:mvvm_design_pattern/view_models/movie_list_view_model.dart';
import 'package:mvvm_design_pattern/view_models/movie_view_model.dart';
import 'package:mvvm_design_pattern/widgets/movie_list.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  final List<MovieViewModel> movies;

  const MovieListPage({Key key, this.movies}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Provider.of<MovieListViewModel>(context, listen: false).fetchMovies("Batman");
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: size.width,
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    vm.fetchMovies(value);
                    _controller.clear();
                  }
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(child: MovieList(movies: vm.movies))
          ],
        ),
      ),
    );
  }
}
