import 'package:flutter/material.dart';

import '../../model/comment.dart';

class CommentWidget extends StatelessWidget {
  CommentWidget({super.key, required this.comment});

  Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            backgroundImage: AssetImage(
              comment.userImage,
            ),
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              elevation: 2,
              child: ListTile(
                title: Text(
                  comment.name,
                  style: const TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  comment.body,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
