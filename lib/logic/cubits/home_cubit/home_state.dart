part of 'home_cubit.dart';

class HomeState {
  final int currentIndex;
  final String title;

  HomeState({
    required this.currentIndex,
    required this.title,
  });

  factory HomeState.initial() {
    return HomeState(
      currentIndex: 0,
      title: 'Home',
    );
  }

  HomeState copyWith({
    int? currentIndex,
    String? title,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      title: title ?? this.title,
    );
  }
}
