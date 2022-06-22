part of 'showtime_cubit.dart';

@immutable
class ShowtimeState extends Equatable {
  final String? value;
  final int? chooseDate;
  final int? tabIndex;
  ShowtimeState(
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

  @override
  List<Object> get props => [
        this.value!,
        this.chooseDate!,
        this.tabIndex!,
      ];
}
