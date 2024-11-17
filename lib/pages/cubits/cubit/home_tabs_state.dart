part of 'home_tabs_cubit.dart';

sealed class HomeTabsState extends Equatable {}

final class HomeTabsInitial extends HomeTabsState {
  final int currentHeader;
  final List<String> headers;

  HomeTabsInitial({
    required this.currentHeader,
    required this.headers,
  });

  @override
  List<Object?> get props => [
        currentHeader,
        headers,
      ];

  HomeTabsInitial copyWith({
    int? currentHeader,
    List<String>? headers,
  }) {
    return HomeTabsInitial(
      currentHeader: currentHeader ?? this.currentHeader,
      headers: headers ?? this.headers,
    );
  }
}
