
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class PickerUtil {

  static Future<XFile?> selectImage() async {
    final picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  static Future<List<XFile>?> selectMultiImage() async{
    final picker = ImagePicker();
    var pickedFile = picker.pickMultiImage();
    return pickedFile;
  }

  static Future<XFile?> takePhotoImage() async {
    final picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.camera);
    return pickedFile;
  }

  static Future<XFile?> selectVido() async {
    final picker = ImagePicker();
    var pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    return pickedFile;
  }

  static Future<List<AssetEntity>?> selectAssets(BuildContext context,{RequestType type = RequestType.all,int maxAssets = 9,Color themeColor = Colors.blue}) async{
    var picker = await AssetPicker.pickAssets(
       context,
       pickerTheme: ThemeData.light().copyWith(
         primaryColor: Colors.white,//**
         primaryColorBrightness: Brightness.light,
         canvasColor: Colors.white, //**
         highlightColor: Colors.transparent,
         toggleableActiveColor: themeColor,
         colorScheme: ColorScheme(
           primary: Colors.grey[900]!,//**
           primaryVariant: Colors.grey[900]!,
           secondary: themeColor,
           secondaryVariant: themeColor,
           background: Colors.white, //**
           surface: Colors.grey[900]!,
           brightness: Brightness.dark,
           error: const Color(0xffcf6679),
           onPrimary: Colors.black,
           onSecondary: Colors.black,
           onSurface: Colors.white,
           onBackground: Colors.white,
           onError: Colors.black,
         ),
       ),
       requestType:type,
       maxAssets: maxAssets
    );
    return picker;
  }
}