import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> signInWithGoogle() async {
    try {
      final AuthCredential credential = await _getGoogleCredential();
      await _auth.signInWithCredential(credential).then((value) {
        final user = value.user;
        if (user != null) {
          _firestore.collection('users').doc(user.uid).get().then((doc) {
            if (!doc.exists) {
              _firestore.collection('users').doc(user.uid).set({
                'email': user.email,
                'fullName': user.displayName,
                'userId': user.uid,
                'avatarUrl': user.photoURL,
                'createdAt': FieldValue.serverTimestamp(),
              });
            }
          });
        }
      });
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Successfully Logged in as ${_auth.currentUser!.email}'),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign in with Google: $e'),
        ),
      );
    }
  }

  Future<AuthCredential> _getGoogleCredential() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleUser = (await googleSignIn.signIn())!;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    return GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You are not logged in yet',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () async {
                await signInWithGoogle();
              },
              label: const Text('Continue with Google',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  )),
              icon: Image.asset(
                'assets/images/social/google_logo.png',
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
