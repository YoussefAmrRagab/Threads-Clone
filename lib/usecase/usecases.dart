import 'dart:math';

import '../../data/repository.dart';

import '../model/comment.dart';
import '../model/post.dart';
import '../model/user.dart';

class UseCases {
  late final Repository _repository;
  final Random _random = Random();

  UseCases(this._repository);

  Future<dynamic> getPosts() async {
    var users = await _repository.getUsers();
    var posts = await _repository.getPosts();
    if (users is List<User>) {
      if (posts is List<Post>) {
        for (var post in posts) {
          for (var user in users) {
            if (post.userId == user.id) {
              post.nameOfUser = user.name;
              post.username = user.username;
              post.userImage = 'assets/images/${user.id}.jpg';
            }
          }
        }
      }
      return posts;
    }
    return users;
  }

  String _generateUserImage(String userImage) {
    int num = _random.nextInt(10) + 1;

    while ("assets/images/$num.jpg" == userImage) {
      num = _random.nextInt(10) + 1;
    }

    return "assets/images/$num.jpg";
  }

  Future<dynamic> getComments(Post post) async =>
      await _repository.getComments(post.id).then((comments) {
        if (comments is List<Comment>) {
          for (var comment in comments) {
            comment.userImage = _generateUserImage(post.userImage);
          }
        }
        return comments;
      });
}
