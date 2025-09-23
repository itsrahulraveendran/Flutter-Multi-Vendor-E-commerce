import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:inktee_web/models/category_model.dart';

import 'package:http/http.dart' as http;
import 'package:inktee_web/services/manage_http_response.dart';

import '../global_variable.dart';

class CategoryController {
  uploadCategory({
    required dynamic pickedImage,
    required dynamic pickedBanner,
    required String name,
    required context,
  }) async {
    try {
      final cloudinary = CloudinaryPublic("dz2vnux0z", "inkteewebimage");

      //upload image
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedImage,
          identifier: "pickedImage",
          folder: 'categoryimages',
        ),
      );
      String image = imageResponse.secureUrl;
      // print(imageResponse);

      CloudinaryResponse bannerResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(pickedBanner, identifier: "pickedBanner", folder: 'categoryimages'),
      );
      String banner = bannerResponse.secureUrl;
      Category category = Category(
        id: "",
        name: name,
        image: image,
        banner: banner,
      );
      print("uptoclodinary");

      http.Response response = await http.post(
        Uri.parse("$uri/api/categories"),
        body: category.toJson(), // this is fine
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
      );

      manageHttpResponse(response: response, context: context, onSuccess: (){
        showSnackBar(context, "UPLOAD CATEGORY SUCCESSFUL");

      });

      print("Sending category JSON: ${category.toJson()}");

      print(bannerResponse);
    } catch (e) {
      print('error uploading image$e');
    }
  }
}
