import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kcalm/model/Model.dart';
import 'package:kcalm/model/objects/DiaryEntry.dart';
import 'package:kcalm/model/providers/SelectedDayProvider.dart';

part 'DiaryProvider.g.dart';

@Riverpod(keepAlive: true)
class Diary extends _$Diary{

  @override
  Future<List<DiaryEntry>> build(){
    final giorno = ref.watch(selectedDayProvider);
    return Model.instance.vociDelGiorno(giorno);
  }

  Future<void> aggiungiVoce(DiaryEntry voce) async{
    await Model.instance.aggiungiVoce(voce);
    ref.invalidateSelf();
    await future;
  }
}