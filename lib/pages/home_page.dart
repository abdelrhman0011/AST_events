import 'package:ast_project/widgets/about_section.dart';
import 'package:ast_project/widgets/footer_section.dart';
import 'package:ast_project/widgets/gallery_section.dart';
import 'package:ast_project/widgets/header_section.dart';
// import 'package:ast_project/widgets/location_section.dart';
import 'package:ast_project/widgets/registration_section.dart';
// import 'package:ast_project/widgets/schedule_section.dart';
import 'package:ast_project/widgets/sponsors_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/logo.png',
          height: 50,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000), 
              Color(0xFF1C1C1C), 
              Color(0xFF2F2F2F), 
              Color(0xFF454545), 
             
             
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeaderSection(),
              const RegistrationSection(),
              const AboutSection(),
              SponsorsSection(),
              //const ScheduleSection(),
             // const LocationSection(),
              const GallerySection(),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
