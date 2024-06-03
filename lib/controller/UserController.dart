import 'package:project_prak_tpm/main.dart';
import 'package:project_prak_tpm/model/UserModel.dart';

class UserController {
  late UserModel userData;

  void setUser(String userEmail, UserModel userData) {
    String status;

    try{
      dataBox.put(userEmail, userData);
      status = "SUCCESS";
    }
    catch(error){
      status = "Fail";
      print(error);
    }
    print("USER LOGIC: Registration $status");
    dataBox.put(userEmail, userData);
  }

  UserModel getUserData(String userEmail){
    return dataBox.get(userEmail);
  }

}
