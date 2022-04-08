import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:submission/screens/detailpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List post = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://newsapi.org/v2/top-headlines?country=id&apiKey=4f3210aded524f3880343e4495f15bdb'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          post = data['articles'];
        });
        print(post);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IndoNews App',
          style: TextStyle(fontFamily: 'Ubuntu'),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [const PopupMenuItem(child: Text(''))];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(
                  url: post[index]['url'],
                  title: post[index]['title'],
                  content: post[index]['content'],
                  publishedAt: post[index]['publishedAt'],
                  author: post[index]['author'],
                  urlToImage: post[index]['urlToImage'],
                );
              }));
            },
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Card(
                  child: Container(
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Expanded(
                              flex: 4,
                              child: post[index]['urlToImage'] != null
                                  ? Image.network(
                                      post[index]['urlToImage'],
                                      height: 200,
                                      width: 400,
                                      fit: BoxFit.cover,
                                    )
                                  : Center()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 10, top: 3, right: 10),
                            child: Text(
                              '${post[index]['title']}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: post.length,
      ),
    );
  }
}
