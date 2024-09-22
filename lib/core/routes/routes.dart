import 'package:chatbox/features/auth/forgot_screen.dart';
import 'package:chatbox/features/auth/login_screen.dart';
import 'package:chatbox/features/auth/sign_up_screen.dart';
import 'package:chatbox/features/chat/contact_info_screen.dart';
import 'package:chatbox/features/contacts/contacts_builder.dart';
import 'package:chatbox/features/groups/creat_group_screen.dart';
import 'package:chatbox/features/groups/group_member_screen.dart';
import 'package:chatbox/features/groups/group_room.dart';
import 'package:chatbox/features/home/home_page.dart';
import 'package:chatbox/features/chat/chat_room.dart';
import 'package:chatbox/logic/cubits/screens/profile_screen.dart';
import 'package:chatbox/logic/cubits/screens/qrcode_screen.dart';
import 'package:chatbox/logic/cubits/screens/search_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> myRoutes = {
  LoginScreen.id: (context) => const LoginScreen(),
  SignUpScreen.id: (context) => const SignUpScreen(),
  HomePage.id: (context) => const HomePage(),
  ForgotScreen.id: (context) => const ForgotScreen(),
  ChatRoom.id: (context) => const ChatRoom(),
  SearchScreen.id: (context) => const SearchScreen(),
  GroupRoom.id: (context) => const GroupRoom(),
  CreatGroupScreen.id: (context) => CreatGroupScreen(),
  GroupMemberScreen.id: (context) => const GroupMemberScreen(),
  ContactsScreen.id: (context) => const ContactsScreen(),
  ContactInfoScreen.id: (context) => const ContactInfoScreen(),
  ProfileScreen.id: (context) => const ProfileScreen(),
  QRCodeScreen.id: (context) => const QRCodeScreen(),
}; // routes