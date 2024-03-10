import 'dart:io';
import 'package:aplikasi/drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Uint8List? _image;
  File? selectedIMage;
  bool isChecked = false;
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.translate(
                    offset: const Offset(1.0, 10.0),
                    child: Image.asset(
                      'assets/logo.png',
                      scale: 2.7,
                    ),
                  ),
                  Align(
                    child: Opacity(
                      opacity: 0.2,
                      child: Image.asset('assets/atas.png'),
                    ),
                  ),
                ],
              ),
              const Text(
                'Sign Up Now',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _image != null
                  ? CircleAvatar(
                      radius: 70, backgroundImage: MemoryImage(_image!))
                  : const CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                    ),
              Positioned(
                  bottom: -0,
                  left: 140,
                  child: IconButton(
                      onPressed: () {
                        showImagePickerOption(context);
                      },
                      icon: const Icon(Icons.add_a_photo))),
              const Text(
                'Masukan Foto Profil Yang Menarik',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    child: const TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          ))),
                    ),
                  ),
                  Container(
                    width: 300,
                    child: const TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          ))),
                    ),
                  ),
                  Container(
                    width: 300,
                    child: const TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          ))),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                              isButtonEnabled = isChecked;
                            });
                          },
                        ),
                        const Text(
                          'Saya Menyetujui Syarat Dan Ketentuan Yang Berlaku',
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(200, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(
                                color: Colors.black, width: 0.5)),
                      ),
                    ),
                    onPressed:
                        isButtonEnabled ? () => _onButtonPressed() : null,
                    child: const Text(
                      'Masuk',
                      style:
                          TextStyle(fontFamily: 'Poppins', color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Opacity(
                      opacity: 0.2,
                      child: Image.asset('assets/bawah.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void _onButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => drawer()),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
