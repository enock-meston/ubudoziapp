class API {
  static const hostAdmin = "http://192.168.1.67/ubudoziweb/admn/";
  static const hostConnect = "http://192.168.1.67/ubudoziweb/android";

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
  //delete hejuru data
  static const deleteHejuruData = hostConnect + "/deleteHejuru.php";

  // update data yo hejuru
  static const updateHejuruDataStatus = hostConnect + "/updateHejuruStatus.php";
  //delete hasi data
  static const deleteHasiData = hostConnect + "/deleteHasi.php";
  // update data yo hasi
  static const updateHasiDataStatus = hostConnect + "/updateHasiStatus.php";

  // phone verification
  static const phoneVerification = hostConnect + "/phone_verification.php";
  // save otp
  static const saveOtp = hostConnect + "/save_otp.php";
  // verify otp
  static const verifyOtp = hostConnect + "/verify_otp.php";
  // change password
  static const changePassword = hostConnect + "/change_password.php";
}
