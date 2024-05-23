import 'package:project_prak_tpm/controller/SharedPreferenceController.dart';
import 'package:project_prak_tpm/main.dart';

class FavoriteController {
  late List<String> favorite;
  String userEmail =
      SharedPreferenceController.sharedPrefData!.getString('email')!;
  FavoriteController() {
    checkNull();
  }

  bool checkFavorite(String uuid) {
    if (favorite.contains(uuid) && favorite != null) {
      return true;
    }
    return false;
  }

  void setFavorite(String uuid) {
    String status;

    if (favorite.contains(uuid)) {
      favorite.remove(uuid);
      status = 'Remove Favorite to $userEmail-fav';
    } else {
      status = 'Add Favorite to $userEmail-fav';
      favorite.add(uuid);
    }
    print("FAVORITE LOGIC: $status");
    dataBox.put('$userEmail-fav', favorite);
  }

  void checkNull(){
    if (dataBox.get('$userEmail-fav') == null) {
      favorite = [];
    } else {
      favorite = dataBox.get('$userEmail-fav');
    }
  }
}
