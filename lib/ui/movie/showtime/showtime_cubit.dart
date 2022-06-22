import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'showtime_state.dart';

class ShowtimeCubit extends Cubit<ShowtimeState> {
  ShowtimeCubit() : super(ShowtimeState());
  void onChangedCinema(String value){
    emit(state.copyWith(value: value));
  }
  void onChooseDate(int choose){
    emit(state.copyWith(chooseDate: choose));
  }
  void calendarTab(int index){
    emit(state.copyWith(tabIndex: index));
  }
}
