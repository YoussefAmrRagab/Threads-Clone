import '../../view/res/strings.dart';
import '../model/comment.dart';
import '../model/post.dart';
import '../model/user.dart';
import 'api.dart';

class Repository {
  late final Api _dataSource;

  Repository(this._dataSource);

  dynamic getPosts() async {
    Map<String, String> posts = await _dataSource.getPosts();
    if (posts[StringManager.status] == ApiStatus.success.name) {
      return postsFromJson(posts[StringManager.data]!);
    } else {
      return posts[StringManager.data];
    }
  }

  dynamic getComments(int postId) async {
    Map<String, String> comments = await _dataSource.getComments(postId);
    if (comments[StringManager.status] == ApiStatus.success.name) {
      return commentsFromJson(comments[StringManager.data]!);
    } else {
      return comments[StringManager.data];
    }
  }

  dynamic getUsers() async {
    Map<String, String> users = await _dataSource.getUsers();
    if (users[StringManager.status] == ApiStatus.success.name) {
      return userFromJson(users[StringManager.data]!);
    } else {
      return users[StringManager.data];
    }
  }
}
