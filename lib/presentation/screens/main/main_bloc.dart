import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/presentation/navigation/navbar_item.dart';
import 'package:moovi_time/presentation/screens/main/main_event.dart';
import 'package:moovi_time/presentation/screens/main/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc()
      : super(const MainState(
          navbarItem: NavbarItem.movies,
        )) {
    on<MainEvent>((event, emit) async {
      event.when(
        init: () {
          // do nothing
        },
        navbarItemClick: (int index) {
          emit(state.copyWith(
            navbarItem: NavbarItem.values[index],
          ));
        },
      );
    });
  }

  @override
  Future<void> close() async {
    super.close();
  }
}
