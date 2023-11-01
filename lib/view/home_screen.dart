import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/res/colors.dart';
import '../view/res/strings.dart';
import '../view/widgets/post_widget.dart';
import '../controller/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.blackColor,
        title: const Text(StringManager.appName),
      ),
      body: Obx(
        () {
          return controller.isPostsLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.blackColor,
                  ),
                )
              : ListView.builder(
                  itemCount: controller.postList.value.length,
                  itemBuilder: (_, i) {
                    return PostWidget(
                      post: controller.postList.value[i],
                      onLikeClicked: () =>
                          controller.toggle(controller.postList.value[i]),
                      onCommentClicked: () => Get.toNamed(
                        StringManager.commentRoute,
                        arguments: {
                          StringManager.argumentKey:
                              controller.postList.value[i]
                        },
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
