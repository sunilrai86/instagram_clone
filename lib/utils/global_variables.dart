

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';

import '../screens/add_post.dart';
import '../screens/profile_screen.dart';

const webScreenSize = 600;
List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
   const AddPostScreen(),
  const Center(child:  Text('notifications')),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];