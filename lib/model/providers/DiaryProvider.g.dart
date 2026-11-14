// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DiaryProvider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Diary)
final diaryProvider = DiaryProvider._();

final class DiaryProvider
    extends $AsyncNotifierProvider<Diary, List<DiaryEntry>> {
  DiaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'diaryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$diaryHash();

  @$internal
  @override
  Diary create() => Diary();
}

String _$diaryHash() => r'efdf228a9712aa0354f2aefcf4a1a262cbe8a027';

abstract class _$Diary extends $AsyncNotifier<List<DiaryEntry>> {
  FutureOr<List<DiaryEntry>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<DiaryEntry>>, List<DiaryEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<DiaryEntry>>, List<DiaryEntry>>,
              AsyncValue<List<DiaryEntry>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
