part of 'home_tabs_cubit.dart';

sealed class HomeTabsState extends Equatable {}

final class HomeTabsInitial extends HomeTabsState {
  final int currentHeader;

  HomeTabsInitial({
    required this.currentHeader,
  });

  @override
  List<Object?> get props => [
        currentHeader,
      ];

  HomeTabsInitial copyWith({
    int? currentHeader,
    List<String>? headers,
  }) {
    return HomeTabsInitial(
      currentHeader: currentHeader ?? this.currentHeader,
    );
  }
}
