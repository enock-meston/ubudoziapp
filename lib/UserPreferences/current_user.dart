
import 'package:get/get.dart';
import 'package:ubudoziapp/UserPreferences/user_preferences.dart';

import '../model/user_profile_model.dart';


class CurrentUser extends GetxController{
  Rx<UserProfileModel> _currentUser = UserProfileModel().obs;

  UserProfileModel get user => _currentUser.value;

  getUserInfo() async{
    UserProfileModel? getUserInfoFromLocalStorage = await RememberUserPrefs.readUserInfo();
    _currentUser.value = getUserInfoFromLocalStorage!;
  }
}