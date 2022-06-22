part of 'showtime_cubit.dart';

@immutable
class ShowtimeState {
  final String? value;
  final int? chooseDate;
  final int? tabIndex;
  const ShowtimeState(
      {this.value, this.chooseDate = 0, this.tabIndex = 0});
  ShowtimeState copyWith({
    String? value,
    int? chooseDate,
    int? tabIndex,
  }) {
    return ShowtimeState(
      value: value ?? this.value,
      chooseDate: chooseDate ?? this.chooseDate,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

 
}
