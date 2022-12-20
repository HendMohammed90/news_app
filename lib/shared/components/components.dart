import 'package:flutter/material.dart';

import '../../modules/web/web_view_screen.dart';

Widget buildArticaleItem(list, context) => InkWell(
      onTap: () {
        // Navigator.pushNamed(context, );
        print('${list['url']}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(
              url: list['url'],
              initialUrl: list['url'],
              URL: list['url'],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage("${list['urlToImage']}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text("${list['title']}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Text(
                      "${list['publishedAt']}",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
