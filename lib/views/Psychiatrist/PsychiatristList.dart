import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/model/Psychiatrist_model.dart';
import 'package:flutter/material.dart';

class PsychiatristListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psychiatrists'),
        backgroundColor: AppColors.kprimary,
      ),
      body: ListView.builder(
        itemCount: psychiatristList.length,
        itemBuilder: (context, index) {
          final psychiatrist = psychiatristList[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(psychiatrist.name),
            subtitle: Text(psychiatrist.specialization),
            trailing: Text(psychiatrist.contactInfo),
            onTap: () {
              // You can add more detailed navigation or actions here
            },
          );
        },
      ),
    );
  }
}
