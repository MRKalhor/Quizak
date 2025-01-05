// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginScreen(),
//     );
//   }
// }

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   Future<void> _login() async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//       // Login successful
//     } on FirebaseAuthException catch (e) {
//       // Handle error
//       print('Error: $e');
//     }
//   }+

//   Future<void> _register() async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//       // Registration successful
//     } on FirebaseAuthException catch (e) {
//       // Handle error
//       print('Error: $e');
//     }
//   }

//   Future<void> _resetPassword() async {
//     try {
//       await _auth.sendPasswordResetEmail(email: _emailController.text);
//       // Password reset email sent
//     } on FirebaseAuthException catch (e) {
//       // Handle error
//       print ('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Auth Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//             ElevatedButton(
//               onPressed: _register,
//               child: Text('Register'),
//             ),
//             ElevatedButton(
//               onPressed: _resetPassword,
//               child: Text('Forgot Password'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }