import 'package:get/get.dart';

import '../../../utils/image.dart';

class HomeController extends GetxController {
  var users = <Map<String, String>>[
    {"name": "Allison", "image": ImagePath.story1},
    {"name": "Davis", "image": ImagePath.story2},
    {"name": "Zaire", "image": ImagePath.story3},
    {"name": "Chance", "image": ImagePath.story4},
    {"name": "Martine", "image": ImagePath.story1},
    {"name": "Joen", "image": ImagePath.story2},
  ].obs;

  var posts = <Map<String, String>>[
    {
      "name": "Charlie Carder",
      "profile": ImagePath.user,
      "postImage": ImagePath.postImage,
    },
    {
      "name": "Alice Johnson",
      "profile": ImagePath.user,
      "postImage": ImagePath.postImage,
    },
  ].obs;
}
