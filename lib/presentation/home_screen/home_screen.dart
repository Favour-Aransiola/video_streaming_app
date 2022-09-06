import 'package:flutter/material.dart';
import 'package:video_streaming_app/app/di.dart';
import 'package:video_streaming_app/domain/models/movie_model.dart';
import 'package:video_streaming_app/presentation/home_screen/home_view_model.dart';
import 'package:video_streaming_app/presentation/home_screen/local_widgets/movie_item.dart';
import 'package:video_streaming_app/presentation/movie_screen/movie_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homePage = HomeViewModel(instance());
  @override
  void initState() {
    homePage.start();
    super.initState();
  }

  @override
  void dispose() {
    homePage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 30,
        title: Text('Recent Video'),
        actions: [
          Text(
            'More',
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: StreamBuilder<List<MovieModel>>(
            stream: homePage.pageContentOutput,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.separated(
                primary: false,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20);
                },
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                      clipBehavior: Clip.hardEdge,
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return MovieScreen(movie: snapshot.data![index]);
                            },
                          ));
                        },
                        child: MovieItem(
                          item: snapshot.data![index],
                        ),
                      ));
                },
              );
            }),
      ),
    );
  }
}
