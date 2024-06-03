import 'package:project_prak_tpm/controller/SharedPreferenceController.dart';
import 'package:project_prak_tpm/main.dart';

class FavoriteController {
  late List<String> favorite;
  String userEmail =
      SharedPreferenceController.sharedPrefData.getString('email')!;
  FavoriteController() {
    checkNull();
  }

  bool checkFavorite(String type, String uuid) {
    if (favorite.contains('$type-$uuid')) {
      return true;
    }
    return false;
  }

  void setFavorite(String type, String uuid) {
    String status;

    if (favorite.contains('$type-$uuid')) {
      favorite.remove('$type-$uuid');
      status = 'Remove Favorite to $userEmail-fav';
    } else {
      status = 'Add Favorite to $userEmail-fav';
      favorite.add('$type-$uuid');
    }
    print("FAVORITE LOGIC: $status");
    dataBox.put('$userEmail-fav', favorite);
  }

  List<String> getFavoriteType(String type){
    List<String> favoriteData;

    favoriteData = favorite.where((element) => element.contains(type)).toList();
    return favoriteData;
  }

  void checkNull(){
    if (dataBox.get('$userEmail-fav') == null) {
      favorite = [];
    } else {
      favorite = dataBox.get('$userEmail-fav');
    }
  }
}
