import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'SelectedDayProvider.g.dart';

@Riverpod(keepAlive: true)
class SelectedDay extends _$SelectedDay{

  @override
  DateTime build(){
    final oggi = DateTime.now();
    return DateTime(oggi.year, oggi.month, oggi.day);
  }

  void giornoPrecedente() => state = DateTime(state.year, state.month, state.day-1);
  void giornoSuccessivo() => state = DateTime(state.year, state.month, state.day+1);
}

