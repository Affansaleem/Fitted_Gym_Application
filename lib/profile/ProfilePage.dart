import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitted/global/Signin_global.dart';
import 'package:fitted/signin/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../firebase_authentication/firebase_auth_services.dart';
import '../reusable/toast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? employeeData;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    fetchEmployeeData();
  }

  Future<void> fetchEmployeeData() async {
    Map<String, dynamic>? data = await DatabaseMethods().getEmployee("0");
    setState(() {
      employeeData = data;
      _nameController.text = data?['Name'] ?? '';
      _phoneController.text = data?['Phone'] ?? '';
      _professionController.text = data?['Profession'] ?? '';
      _countryController.text = data?['Country'] ?? '';
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      await _uploadProfileImage(_selectedImage!);
      fetchEmployeeData();
    }
  }

  Future<void> _uploadProfileImage(File imageFile) async {
    try {
      String userId = "0";
      final storageRef =
          FirebaseStorage.instance.ref().child('profileImages/$userId');
      final uploadTask = storageRef.putFile(imageFile);
      final snapshot = await uploadTask.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance.collection('Users').doc(userId).update({
        'profileImageUrl': downloadUrl,
      });
      GlobalVars.profileImage = employeeData?['profileImageUrl'];
      showToast(message: "Profile image uploaded successfully!");
    } catch (e) {
      showToast(message: "Error uploading profile image: $e");
      print("Error uploading profile image: $e");
    }
  }

  Future<void> _showEditDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Edit Profile'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone'),
                ),
                TextFormField(
                  controller: _professionController,
                  decoration: const InputDecoration(labelText: 'Profession'),
                ),
                TextFormField(
                  controller: _countryController,
                  decoration: const InputDecoration(labelText: 'Country'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                await _saveProfileChanges();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveProfileChanges() async {
    Map<String, dynamic> updatedEmployeeInfo = {
      "Name": _nameController.text,
      "Phone": _phoneController.text,
      "Profession": _professionController.text,
      "Country": _countryController.text,
    };
    await DatabaseMethods().addEmployee(updatedEmployeeInfo, "0");
    showToast(message: "Profile Updated Successfully!");
    fetchEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2126),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Color(0xFFE0FE10),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.photo),
                      title: const Text('Pick from Gallery'),
                      onTap: () {
                        Navigator.pop(context);
                        _pickImage(ImageSource.gallery);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.camera_alt),
                      title: const Text('Take a Photo'),
                      onTap: () {
                        Navigator.pop(context);
                        _pickImage(ImageSource.camera);
                      },
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.camera_alt,
              color: Color(0xFFE0FF00),
            ),
          ),
          IconButton(
            onPressed: _showEditDialog,
            icon: const Icon(
              Icons.edit,
              color: Color(0xFFE0FF00),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1C2126),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                child: GlobalVars.profileImage != null
                    ? Image.network(
                        GlobalVars.profileImage!,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/images/img_19.png",
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
              ),
              employeeData?['Phone'] != null
                  ? Column(
                      children: [
                        Text(
                          employeeData?['Name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          employeeData?['Phone'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          employeeData?['Profession'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          employeeData?['Country'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(
                      color: Color(0xFFE0FF00),
                    ),
              GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color(0xFFE0FF00).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "LOGOUT",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
