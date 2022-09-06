import 'package:flutter/material.dart';
import 'package:video_streaming_app/domain/models/movie_model.dart';

class MovieItem extends StatelessWidget {
  MovieModel item;
  MovieItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(item.banner,
                    errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 140,
                    color: Colors.grey,
                  );
                }, height: 140, width: double.infinity, fit: BoxFit.cover),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(children: [
                      Flexible(
                        flex: 3,
                        child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: 1.5,
                              child: Image.network(item.banner,
                                  errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.grey,
                                );
                              },
                                  height: 30,
                                  width: double.infinity,
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  item.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                Text(
                                  item.description,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: AspectRatio(
                          aspectRatio: 1.4,
                          child: Container(
                            width: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.monetization_on,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ]),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(15))),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
