import 'package:http/http.dart' as http;
import '../../util/extension.dart';
import '../../view/res/strings.dart';

enum ApiStatus { success, fail }

const int timeoutDuration = 8;

class Api {
  Future<Map<String, String>> getPosts() async {
    try {
      var response = await http
          .get(Uri.parse(StringManager.baseUrl + StringManager.postsEndpoint))
          .timeout(const Duration(seconds: timeoutDuration));

      return response.data();
    } catch (e) {
      return e.message();
    }
  }

  Future<Map<String, String>> getComments(int postId) async {
    try {
      var response = await http
          .get(Uri.parse(
              '${StringManager.baseUrl}${StringManager.postsEndpoint}/$postId/${StringManager.commentsEndpoint}'))
          .timeout(const Duration(seconds: timeoutDuration));

      return response.data();
    } catch (e) {
      return e.message();
    }
  }

  Future<Map<String, String>> getUsers() async {
    try {
      var response = await http
          .get(Uri.parse(StringManager.baseUrl + StringManager.usersEndpoint))
          .timeout(const Duration(seconds: timeoutDuration));

      return response.data();
    } catch (e) {
      return e.message();
    }
  }
}
