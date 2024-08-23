import 'package:cred_assign/views/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Cred',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(
            surface: Colors.black,
            secondary: Color.fromARGB(255, 86, 86, 86),
            secondaryContainer: Color.fromARGB(255, 28, 28, 30),
            primary: Colors.black,
            primaryContainer: Colors.white,
          ),
          brightness: Brightness.dark,
          switchTheme: SwitchTheme.of(context).copyWith(
              trackOutlineColor: WidgetStatePropertyAll(Colors.white),
              thumbColor: WidgetStatePropertyAll(Colors.white)),
          textTheme: GoogleFonts.notoSerifTextTheme().copyWith(
              bodyLarge: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
              labelLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
              ),
              labelMedium: TextStyle(
                color: Color.fromARGB(255, 86, 86, 86),
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              ),
              titleLarge: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp),
              bodyMedium: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold)),
          useMaterial3: true,
        ),
        home: const LandingScreen(),
      );
    });
  }
}
