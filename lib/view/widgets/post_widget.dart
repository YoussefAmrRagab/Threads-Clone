import 'package:flutter/material.dart';
import '../../model/post.dart';
import '../../view/res/strings.dart';
import '../../util/extension.dart';
import 'custom_text_button.dart';
import 'package:get/get.dart';

class PostWidget extends StatelessWidget {
  PostWidget(
      {super.key,
      required this.post,
      required this.onLikeClicked,
      required this.onCommentClicked});

  Post post;
  VoidCallback onLikeClicked;
  VoidCallback onCommentClicked;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Column(
        children: [
          5.mh,
          Row(
            children: [
              14.mw,
              CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: AssetImage(
                  post.userImage,
                ),
                radius: 24,
              ),
              8.mw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.nameOfUser,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '@${post.username}',
                    style: const TextStyle(color: Colors.black45, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          ListTile(
            title: Text(
              post.title,
              style: const TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              post.body,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => CustomTextButton(
                  text: "Like${post.isLiked.value ? 'd' : ''}",
                  isLiked: post.isLiked.value,
                  onClickListener: onLikeClicked,
                ),
              ),
              CustomTextButton(
                text: StringManager.comment,
                isLiked: false,
                onClickListener: onCommentClicked,
              )
            ],
          )
        ],
      ),
    );
  }
}
