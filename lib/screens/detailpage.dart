import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final url;
  final title;
  final content;
  final publishedAt;
  final author;
  final urlToImage;

  DetailScreen({
    this.url,
    this.title,
    this.content,
    this.publishedAt,
    this.author,
    this.urlToImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail News'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$title',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Author : $author',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$publishedAt',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: urlToImage != null
                    ? Image.network(urlToImage)
                    : Container(
                        height: 250,
                        color: Colors.grey[200],
                      ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text('$content',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                        )),
                    Divider(),
                    Text('$url',
                        style:
                            TextStyle(fontFamily: 'Ubuntu', color: Colors.blue))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
