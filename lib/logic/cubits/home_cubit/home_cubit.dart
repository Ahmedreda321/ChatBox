import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void changeIndex(int index) {
    emit(state.copyWith(
      currentIndex: index,
      title: _getTitleForIndex(index),
    ));
  }

  String _getTitleForIndex(int index) {
    final titles = ['Home', 'Groups', 'Contacts', 'Settings'];
    return titles[index];
  }
}
