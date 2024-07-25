import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String post;
  final String userImage;
  final String postImage;
  final String carbonSavings;

  PostCard({
    required this.username,
    required this.post,
    required this.userImage,
    required this.postImage,
    required this.carbonSavings,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
            title: Text(username),
            subtitle: Text(carbonSavings),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(postImage),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post),
          ),
          ButtonBar(
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}