import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_tabs_state.dart';

class HomeTabsCubit extends Cubit<HomeTabsState> {
  HomeTabsCubit()
      : super(
          HomeTabsInitial(
            currentHeader: 0,
            headers: const [
              'Home',
              'About',
              'Carreira',
              'Contato',
            ],
          ),
        );

  void onChanged(int index) {
    final currentState = state as HomeTabsInitial;
    final newState = currentState.copyWith(currentHeader: index);

    emit(
      newState,
    );
  }
}
