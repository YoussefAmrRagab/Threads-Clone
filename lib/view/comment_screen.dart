import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/post.dart';
import '../view/res/strings.dart';
import '../view/widgets/comment_widget.dart';
import '../view/res/colors.dart';
import '../controller/controller.dart';

class CommentScreen extends StatelessWidget {
  CommentScreen({super.key});

  final Controller controller = Get.find();
  final Post post = Get.arguments[StringManager.argumentKey];

  @override
  Widget build(BuildContext context) {
    controller.getComments(post);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.blackColor,
        title: const Text(StringManager.comments),
      ),
      body: Obx(() {
        return controller.isCommentsLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: ColorManager.blackColor,
                ),
              )
            : ListView.builder(
                itemCount: controller.commentList.value.length,
                itemBuilder: (_, i) {
                  return CommentWidget(
                    comment: controller.commentList.value[i],
                  );
                },
              );
      }),
    );
  }
}
