import 'package:get/get.dart';
import '../usecase/usecases.dart';
import '../model/post.dart';
import '../view/res/strings.dart';
import '../model/comment.dart';

class Controller extends GetxController {
  late final UseCases _useCases;

  Controller(this._useCases);

  RxBool isPostsLoading = true.obs;
  RxBool isCommentsLoading = true.obs;
  Rx<List<Post>> postList = Rx<List<Post>>([]);
  Rx<List<Comment>> commentList = Rx<List<Comment>>([]);

  void fetchData() => _useCases.getPosts().then((data) {
        if (data is List<Post>) {
          postList.value = data;
        } else {
          Get.snackbar(StringManager.error, data);
        }
        isPostsLoading.value = false;
      });

  void getComments(Post post) {
    isCommentsLoading.value = true;
    commentList.value = [];
    _useCases.getComments(post).then((data) {
      if (data is List<Comment>) {
        commentList.value = data;
      } else {
        Get.snackbar(StringManager.error, data);
      }
      isCommentsLoading.value = false;
    });
  }

  void toggle(Post post) => post.isLiked.value = !post.isLiked.value;
}
