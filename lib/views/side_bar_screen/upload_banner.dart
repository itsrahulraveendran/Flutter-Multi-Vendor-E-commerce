import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:inktee_web/controller/banner_controller.dart';

class UploadScreen extends StatefulWidget {
  static const String id ='\banner-screen';
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
final BannerController _bannerController =  BannerController();
  dynamic _image;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.topLeft,
        child: Text("Banners",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36),),
      ),
      Divider(color: Colors.grey,thickness: 0.2,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              height: 150,
              width: 150,
              child: Center(
                child: _image != null
                    ? Image.memory(_image, fit: BoxFit.cover)
                    : Center(child: Text("Choose image")),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: Text("Upload image"),
              ),ElevatedButton(onPressed: ()async{
                await _bannerController.uploadBanner(pickedImage: _image, context: context);
              }, child: Text("Save"))
            ],
          ),


          Row(
            children: [
              Expanded(
                child: Container(color: Colors.red, height: 100),
              ),
              Container(
                width: 200,
                color: Colors.blue,
                height: 100,
              ),
            ],
          ),



          Row(
            children: [
              Expanded(
                flex: 7, // 70%
                child: Container(
                  color: Colors.blue,
                  height: 100,
                  child: Center(child: Text("70%")),
                ),
              ),
              Expanded(
                flex: 3, // 30%
                child: Container(
                  color: Colors.green,
                  height: 100,
                  child: Center(child: Text("30%")),
                ),
              ),
            ],
          )


        ],
      ),

    ],);
  }
}
