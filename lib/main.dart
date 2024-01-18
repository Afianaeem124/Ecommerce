import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/model/categorylist.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/screens/checkout.dart';
import 'package:ecommerce_app/screens/signup.dart';
import 'package:ecommerce_app/screens/splashscreen.dart';
import 'package:ecommerce_app/screens/validations/login.dart';
import 'package:ecommerce_app/screens/validations/signup.dart';
import 'package:ecommerce_app/widgets/general/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

List<Product> favoriteList = [];
List<Product> bagList = [];
double totalamount = 0;
String userName = "";
String useremail = "";
String userId = "";
// List<ProductModal> allpro;
ProductModal proItems = ProductModal();
ProductModal saleItems = ProductModal();

List<Category> categoryList = [];
Categorylist? categoryItems;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce Store',
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primaryColor: Colors.white,
        useMaterial3: true,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        buttonColor: redIconwithButton,
        scaffoldBackgroundColor: greyScaffoldbf,
        // AppBar Theme Data
        appBarTheme: AppBarTheme(
            color: greyScaffoldbf,
            titleTextStyle:
                GoogleFonts.metrophobic(fontSize: 18, color: white6)),
        iconTheme: IconThemeData(color: white6, size: 10),
        // Bottom Navigation Bar Theme Data
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            elevation: 4,
            backgroundColor: greyBottomBar,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedIconTheme: const IconThemeData(size: 26, opacity: 1),
            unselectedIconTheme: const IconThemeData(size: 24, opacity: 0.7),
            selectedItemColor: redIconwithButton,
            unselectedItemColor: greyLabelText,
            unselectedLabelStyle: GoogleFonts.metrophobic(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            selectedLabelStyle: GoogleFonts.metrophobic(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            )),
        // Text Theme Data
        textTheme: TextTheme(
            displayLarge: GoogleFonts.metrophobic(
                fontSize: 34, color: white6, fontWeight: FontWeight.w900),
            displayMedium: GoogleFonts.metrophobic(
                fontSize: 16, color: white6, fontWeight: FontWeight.w900),
            labelSmall: GoogleFonts.metrophobic(
                fontSize: 14, color: white6, fontWeight: FontWeight.w300),
            titleSmall: GoogleFonts.metrophobic(
                fontSize: 13, color: white6, fontWeight: FontWeight.w300),
            bodySmall:
                GoogleFonts.metrophobic(fontSize: 14, color: greyLabelText),
            bodyMedium: GoogleFonts.metrophobic(
              fontSize: 16,
              color: white6,
              fontStyle: FontStyle.normal,
            ),
            labelMedium: GoogleFonts.metrophobic(
                fontSize: 14, color: greyLightTextField)),
        // Input Decoration Theme
        inputDecorationTheme: InputDecorationTheme(
            suffixIconColor: greyHintText,
            fillColor: greyLightTextField,
            filled: true,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            labelStyle:
                GoogleFonts.metrophobic(fontSize: 13, color: greyLabelText),
            // hintStyle: const TextTheme().labelSmall,
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: greyLightTextField, width: 0.5)),
            enabledBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide:
                    BorderSide(color: greyLightTextField.withOpacity(0.50))),
            errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: errorColor)),
            focusedErrorBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: errorColor,
                ))),
      ),
      home: const SplashScreen(),
    );
  }
}
