import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'dart:html' as html;

// 📌 GetX Controller für Benutzerverwaltung
class UserController extends GetxController {
  var users = <User>[].obs;

  void addUser(String name, String email, String address, dynamic image) {
    users.add(User(name: name, email: email, address: address, image: image));
  }

  void editUser(
      int index, String name, String email, String address, dynamic image) {
    users[index] =
        User(name: name, email: email, address: address, image: image);
  }

  void deleteUser(int index) {
    users.removeAt(index);
  }
}

// 📌 Benutzer-Datenmodell
class User {
  String name;
  String email;
  String address;
  dynamic image; // Kann eine Datei (Mobile) oder Uint8List (Web) sein

  User(
      {required this.name,
      required this.email,
      required this.address,
      this.image});
}

// 📌 Users Screen UI
class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: Obx(() => controller.users.isEmpty
          ? const Center(child: Text('No users added.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.users.length,
              itemBuilder: (context, index) {
                final user = controller.users[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: user.image != null
                          ? (user.image is Uint8List
                              ? MemoryImage(user.image)
                              : FileImage(user.image))
                          : null,
                      child:
                          user.image == null ? const Icon(Icons.person) : null,
                    ),
                    title: Text(user.name),
                    subtitle: Text('${user.email}\n${user.address}'),
                    isThreeLine: true,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showUserDialog(
                              editMode: true, index: index, user: user),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => controller.deleteUser(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showUserDialog(editMode: false),
        child: const Icon(Icons.add),
      ),
    );
  }

  // 📌 Benutzer-Dialog (Hinzufügen/Bearbeiten)
  void _showUserDialog({bool editMode = false, int? index, User? user}) {
    TextEditingController nameController =
        TextEditingController(text: editMode ? user!.name : '');
    TextEditingController emailController =
        TextEditingController(text: editMode ? user!.email : '');
    TextEditingController addressController =
        TextEditingController(text: editMode ? user!.address : '');
    Rx<dynamic> imageFile =
        Rx<dynamic>(editMode ? user?.image : null); // FIXED!

    void pickImage() async {
      if (GetPlatform.isWeb) {
        FilePickerResult? result =
            await FilePicker.platform.pickFiles(type: FileType.image);
        if (result != null && result.files.single.bytes != null) {
          imageFile.value = result.files.single.bytes;
        }
      } else {
        final pickedFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          imageFile.value = File(pickedFile.path);
        }
      }
    }

    Get.dialog(
      AlertDialog(
        title: Text(editMode ? 'Edit User' : 'Add User'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: pickImage,
                child: Obx(() => CircleAvatar(
                      radius: 40,
                      backgroundImage: imageFile.value != null
                          ? (imageFile.value is Uint8List
                              ? MemoryImage(imageFile.value)
                              : FileImage(imageFile.value as File))
                          : null,
                      child: imageFile.value == null
                          ? const Icon(Icons.camera_alt, size: 40)
                          : null,
                    )),
              ),
              const SizedBox(height: 10),
              TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name')),
              TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email')),
              TextField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: 'Address')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  addressController.text.isNotEmpty) {
                if (editMode) {
                  controller.editUser(
                      index!,
                      nameController.text,
                      emailController.text,
                      addressController.text,
                      imageFile.value);
                } else {
                  controller.addUser(nameController.text, emailController.text,
                      addressController.text, imageFile.value);
                }
                Get.back();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
