class API {
  static const hostAdmin = "http://192.168.1.68/ubudoziweb/admn/";
  static const hostConnect = "http://192.168.1.68/ubudoziweb/android";

  // signup
  static const signup = hostConnect + "/signup.php";
  // login
  static const login = hostConnect + "/login.php";
  // get all users
  static const getAllUsers = hostConnect + "/get_all_users.php";
  //get my profile
  static const getMyProfile = hostConnect + "/get_my_profile.php";
  // save hejuru data
  static const saveHejuruData = hostConnect + "/hejuru.php";
  // get hejuru data
  static const getHejuruData = hostConnect + "/selectHejuru.php";
  // save hasi data
  static const saveHasiData = hostConnect + "/hasi.php";
  // get hasi data
  static const getHasiData = hostConnect + "/selectHasi.php";
}
