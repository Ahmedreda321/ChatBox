import 'package:chatbox/logic/cubits/home_cubit/home_cubit.dart';
import 'package:chatbox/features/auth/widgets/input_field_widget.dart';
import 'package:chatbox/features/auth/widgets/my_icon_svg.dart';
import 'package:chatbox/features/chat/chats_builder.dart';
import 'package:chatbox/features/contacts/contacts_builder.dart';
import 'package:chatbox/features/groups/creat_group_screen.dart';
import 'package:chatbox/features/groups/groups_builder.dart';
import 'package:chatbox/features/home/widgets/bottom_nav_bar.dart';
import 'package:chatbox/core/helper/bottom_sheet_helper.dart';
import 'package:chatbox/features/home/widgets/home_app_bar.dart';
import 'package:chatbox/features/home/widgets/mybox.dart';
import 'package:chatbox/features/settings/settings_screen.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/space_widget.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/firebase/firebase_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfing().init(context);
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Builder(
        builder: (BuildContext context) {
          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Scaffold(
                appBar: HomeAppBar(title: state.title),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                bottomNavigationBar: MyBottomNavBar(
                  currentIndex: state.currentIndex,
                  onTap: (index) =>
                      context.read<HomeCubit>().changeIndex(index),
                ),
                floatingActionButton: state.currentIndex == 3
                    ? null
                    : _buildFloatingActionButton(context, state),
                body: IndexedStack(
                  index: state.currentIndex,
                  children: const [
                    ChatsBuilder(),
                    GroupsScreen(),
                    ContactsScreen(),
                    SettingsScreen(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context, HomeState state) {
    return FloatingActionButton(
      onPressed: () {
        switch (state.currentIndex) {
          case 0:
            showBottomhelperSheet(
              context,
              MyBox(
                body: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: InputFieldWidget(
                        controller: emailController,
                        hintText: 'your friend username',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        FireData().creatRoom(
                          emailController.text,
                        );
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            );
            break;
          case 1:
            Navigator.pushNamed(context, CreatGroupScreen.id);
            break;
          case 2:
            showBottomhelperSheet(
              context,
              MyBox(
                body: MyBox(
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfing.screenWidth! * .02,
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 4,
                              child: InputFieldWidget(
                                autofocus: true,
                                //  controller: userNameController,
                                hintText: 'your friend username',
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                child: const Text('Add'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VSpace(value: 2),
                    ],
                  ),
                ),
              ),
            );
            break;
        }
      },
      child: _getFloatingActionButtonIcon(state.currentIndex),
    );
  }

  Widget _getFloatingActionButtonIcon(int index) {
    switch (index) {
      case 0:
        return const MyIconSvg(svgIcon: Assets.svgsAddChat, value: 4);
      case 1:
        return const MyIconSvg(svgIcon: Assets.svgsAddGroup, value: 3.5);
      case 2:
        return const MyIconSvg(svgIcon: Assets.svgsUserAdd, value: 3);
      default:
        return const SizedBox();
    }
  }
}
