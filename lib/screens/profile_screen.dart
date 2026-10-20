import 'package:flutter/material.dart';
import 'package:wisata_agus/widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSignedIn = false;
  final String userName = 'Agus';
  final String fullName = 'Agus Firman';
  final int favoriteCandiCount = 3;

  void signIn() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple[50],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ProfileInfoItem(
                    icon: Icons.lock,
                    label: 'Pengguna',
                    value: userName,
                    iconColor: Colors.amber,
                  ),
                  const SizedBox(height: 4),
                  const Divider(),
                  const SizedBox(height: 4),
                  ProfileInfoItem(
                    icon: Icons.person,
                    label: 'Nama',
                    value: fullName,
                    showEditIcon: isSignedIn,
                    onEditPressed: () => debugPrint('Icon edit ditekan'),
                    iconColor: Colors.blue,
                  ),
                  const SizedBox(height: 4),
                  const Divider(),
                  const SizedBox(height: 4),
                  ProfileInfoItem(
                    icon: Icons.favorite,
                    label: 'Favorit',
                    value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
                    iconColor: Colors.red,
                  ),
                  const SizedBox(height: 20),
                  Divider(color: Colors.deepPurple[100]),
                  const SizedBox(height: 20),
                  isSignedIn
                      ? TextButton(
                          onPressed: signOut,
                          child: const Text('Sign Out'),
                        )
                      : TextButton(
                          onPressed: signIn,
                          child: const Text('Sign In'),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}