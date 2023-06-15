import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:projecthomepage/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const GetMaterialApp(
        debugShowCheckedModeBanner: false,
      home: LoginPage(),
    )
  );
}

// class HomScreen extends StatefulWidget {
//   const HomScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomScreen> createState() => _HomScreenState();
// }
//
// class _HomScreenState extends State<HomScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Center(
//         child: FloatingActionButton(
//           child: const Text("Navigate"),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
//           }
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     const MaterialApp(
//       home: HomeScreen(),
//     )
//   );
// }
//
// class HomeScreen extends StatefulWidget{
//   const HomeScreen({super.key});
//
//   @override
//   _HomeScreen createState() => _HomeScreen();
// }
// class _HomeScreen extends State<HomeScreen> {
//   @override
//   void initState(){
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//
//       ),
//     );
//   }
// }
// void main() => runApp(const MyApp());
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Center(
//         child: Column(
//           children:  <Widget>[
//             Container(
//               margin: const EdgeInsets.all(25),
//               child: FloatingActionButton(
//                 child: const Text('HomeScreen', style: TextStyle(fontSize: 20.0),),
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
//                 },
//
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//     }
//   }