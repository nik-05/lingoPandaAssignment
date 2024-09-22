import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:lingo_panda_assignment/features/comments/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentServices {
  Future<List<Comment>?> fetchComments() async {
    List<Comment>? comments;

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if(response.statusCode == 200) {
        comments = commentFromJson(response.body);
      }
    } catch (e) {
      print('check');
      print(e);
      throw e.toString();
    }

    return comments;
  }

  Future<bool> isMaskedEmail() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setDefaults({'showFullEmailVal': false});

    await remoteConfig.fetchAndActivate();

    final bool showFullEmail = remoteConfig.getBool('showFullEmailVal');
    print('bool from showFullEmailVal $showFullEmail');
    return showFullEmail;
  }
}