
import 'dart:developer';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:inktee_web/global_variable.dart';
import 'package:inktee_web/models/banner_model.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../services/manage_http_response.dart';

class BannerController {
  uploadBanner({required dynamic pickedImage, required context}) async {
    try {
      final cloudinary = CloudinaryPublic("dz2vnux0z", "inkteewebimage");
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedImage,
          identifier: "pick image",
          folder: 'banners',
        ),
      );
      String image = imageResponse.secureUrl;

      BannerModel bannerModel = BannerModel(id: "id", image: image);
      http.Response response =await http.post(
        Uri.parse('$uri/api/banner'),
        body: bannerModel.toJson(),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },

      );
      log("📡 API Request → $uri/api/banner");
      manageHttpResponse(response: response, context: context, onSuccess: (){
        showSnackBar(context, "UPLOAD Banner SUCCESSFUL");

      });
    } catch (e) {print(e);}
  }
}
