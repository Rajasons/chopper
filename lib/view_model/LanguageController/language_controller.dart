import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../constant/image.dart';
import '../../language/app_translation.dart';
import '../../sharedpreference/shared_prefrences.dart';

class LanguageController extends GetxController{

   static LanguageController  get instant => Get.find();

    RxBool isdarktheme = false.obs;

    RxList<Map> language = <Map>[
     {"name": "English","imageUrl":AppImage.English,"language_code":"en"},
     {"name": "Hindi","imageUrl":AppImage.Hindi,"language_code":"hi"},
     {"name": "French","imageUrl":AppImage.French,"language_code":"fr"},
     {"name": "Arebic","imageUrl":AppImage.Arebic,"language_code":"sa"},
     {"name": "Italian","imageUrl":AppImage.Italian,"language_code":"it"},
     {"name": "Chinese","imageUrl":AppImage.Chinese,"language_code":"zh"},
     {"name": "Spenish","imageUrl":AppImage.Spenish,"language_code":"es"},
     {"name": "Portugal","imageUrl":AppImage.Portugal,"language_code":"pt"},
   ].obs;

    RxList<bool> Selected_Language = <bool>[true,false,false,false,false,false,false,false].obs;



    void selectedLanguage(int index){

     Selected_Language.fillRange(0, 8,false);
     changeLanguage(language[index]['language_code']);
     SharedPrefrencesServices().setSelectedLanguage(index);
     Selected_Language[index]=true;

    }

}