import 'package:calculator/utils/size/size_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/style/app_textstyle.dart';
import '../../../view_model/login_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = context.watch<AuthViewModel>().getUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthViewModel>().logout(context);
            },
            icon: const Icon(Icons.logout,color: Colors.black,),
          ),
        ],
      ),
      body: user != null
          ? context.watch<AuthViewModel>().loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My profile",
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const SizedBox(width: 15,),
                   if (user.photoURL != null)
                     Image.network(
                       user.photoURL!,
                       width: 100,
                       height: 100,
                     ),IconButton(
                     onPressed: () {
                       context.read<AuthViewModel>().updateImageUrl(
                           "https://onlinepngtools.com/images/examples-onlinepngtools/man-on-the-mountain-edge-avatar.png");
                     },
                     icon: const Icon(Icons.edit),
                   ),
                  ],
                ),
                const SizedBox(height: 20,),
                Text(
                  user.email.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                ListTile(

                )
                // Text(
                //   user.uid,
                //   style:
                //   AppTextStyle.interSemiBold.copyWith(fontSize: 24),
                // ),
                // SizedBox(height: 12.h),
                // Text(
                //   user.email.toString(),
                //   style:
                //   AppTextStyle.interSemiBold.copyWith(fontSize: 24),
                // ),
                // SizedBox(height: 12.h),
                // Text(
                //   user.displayName.toString(),
                //   style:
                //   AppTextStyle.interSemiBold.copyWith(fontSize: 24),
                // ),
                // if (user.photoURL != null)
                //   Image.network(
                //     user.photoURL!,
                //     width: 200,
                //     height: 200,
                //   ),
                // IconButton(
                //   onPressed: () {
                //     context.read<AuthViewModel>().updateImageUrl(
                //         "https://www.tenforums.com/attachments/tutorials/146359d1501443008-change-default-account-picture-windows-10-a-user.png");
                //   },
                //   icon: const Icon(Icons.image),
                // )
              ],
            ),
          )
          : const Center(
        child: Text("USER NOT EXIST"),
      ),
    );
  }
}
