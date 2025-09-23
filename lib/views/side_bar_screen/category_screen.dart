import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inktee_web/controller/category_controller.dart';

class CategoryScreen extends StatefulWidget {
  static const String id = 'category-screen';

  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CategoryController _categoryController = CategoryController();

  dynamic _image;
  dynamic _bannerImage;

  // late String _banner;
  late String categoryname;

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

  pickImageBanner() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _bannerImage = result.files.first.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Categories",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(4),
                child: Divider(color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          height: 200,
                          width: 200,
                          child: Center(
                            child: _image != null
                                ? Image.memory(_image, fit: BoxFit.cover)
                                : Center(child: Text("Choose image")),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: Text("Upload image"),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      onChanged: (value) {
                        categoryname = value;
                      },
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return "Enter category name";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Enter category name",
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Cancel")),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: ()async {
                      if (_formKey.currentState!.validate()) {
                        _categoryController.uploadCategory(pickedImage: _image, pickedBanner: _bannerImage, name: categoryname,context: context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: Text("Save", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              Divider(color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          height: 200,
                          width: 200,
                          child: Center(
                            child: _bannerImage != null
                                ? Image.memory(_bannerImage, fit: BoxFit.cover)
                                : Center(child: Text("Choose image")),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          pickImageBanner();
                        },
                        child: Text("Upload image"),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
