import 'dart:io';

import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/data/typography.dart';
import 'package:aiserenity/profile/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _aboutController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  String? _userEmail;
  bool _isLoading = true;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _user = _auth.currentUser;
  }

  Future<void> _uploadImage(Reference storageRef) async {
    try {
      await storageRef.putFile(_selectedImage!);
      final imageUrl = await storageRef.getDownloadURL();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Image uploaded successfully: $imageUrl")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error uploading image: ${e.toString()}")),
      );
    }
  }

  Future<void> _loadUserData() async {
    _user = _auth.currentUser;
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('user_email');

    setState(() {
      if (_user != null && _user!.email != null) {
        _userEmail = _user!.email;
      } else if (storedEmail != null) {
        _userEmail = storedEmail;
      }
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: AppTypography.kBold20.copyWith(color: AppColors.kWhite),
        ),
        backgroundColor: AppColors.kprimary,
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Email",
                    style: AppTypography.kBold16,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    _userEmail ?? "Email not available",
                    style: AppTypography.kSemiBold14.copyWith(color: AppColors.kGreySvg),
                  ),
                  SizedBox(height: 24.h),
                  UserImagePicker(
                    onPickImage: (pickedImage) {
                      setState(() {
                        _selectedImage = pickedImage;
                      });
                    },
                  ),
                  if (_selectedImage != null) ...[
                    SizedBox(height: 16.h),
                    Center(
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundImage: FileImage(_selectedImage!),
                      ),
                    ),
                  ],
                  SizedBox(height: 24.h),
                  Text(
                    "About Me",
                    style: AppTypography.kBold16,
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    controller: _aboutController,
                    maxLines: 6,
                    maxLength: 250,
                    style: AppTypography.kSemiBold14.copyWith(color: AppColors.kGreySvg),
                    decoration: InputDecoration(
                      hintText: "Tell us about yourself... (Max 250 characters)",
                      hintStyle: AppTypography.kSemiBold14.copyWith(color: AppColors.kGreyborder),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 100.w,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_aboutController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please fill in the 'About Me' section.")),
                            );
                            return;
                          }

                          if (_selectedImage != null && _user != null) {
                            final storageRef = FirebaseStorage.instance
                                .ref()
                                .child("user_images")
                                .child('${_user!.uid}.jpg');

                            try {
                              await _uploadImage(storageRef);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Information saved successfully!")),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Failed to save: ${e.toString()}")),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please select an image first.")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kprimary,
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                        ),
                        child: Text(
                          "Save",
                          style: AppTypography.kSemiBold14.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () async {
                      final shouldLogout = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text("Logout", style: AppTypography.kBold16),
                              content: Text("Are you sure you want to logout?", style: AppTypography.kLight14),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(ctx).pop(false),
                                  child: Text("Cancel", style: AppTypography.kSemiBold14.copyWith(color: AppColors.kprimary)),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(ctx).pop(true),
                                  child: Text("Logout", style: AppTypography.kSemiBold14.copyWith(color: AppColors.kprimary)),
                                ),
                              ],
                            ),
                          ) ??
                          false;

                      if (shouldLogout) {
                        try {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Logout failed: ${e.toString()}')),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kprimary,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                    ),
                    child: Text(
                      "Logout",
                      style: AppTypography.kSemiBold16.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
