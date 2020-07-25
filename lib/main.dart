import 'package:flutter/material.dart';
import 'package:mvvm_design_pattern/pages/movie_list_page.dart';
import 'package:mvvm_design_pattern/view_models/movie_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      home: ChangeNotifierProvider(
        create: (context) => MovieListViewModel(),
        child: MovieListPage(),
      ),
    );
  }
}
