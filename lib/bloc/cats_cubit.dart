import 'package:bloc_state/bloc/cats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsCubit extends Cubit<CatsState> {
  CatsCubit() : super(const CatsInitial());

  Future<void> loadCats() async {
    try {
      emit(const CatsLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      final response = await Future.value([
        'https://picsum.photos/250?image=1',
        'https://picsum.photos/250?image=2',
        'https://picsum.photos/250?image=3',
        'https://picsum.photos/250?image=4',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=6',
        'https://picsum.photos/250?image=7',
        'https://picsum.photos/250?image=8',
        'https://picsum.photos/250?image=9',
        'https://picsum.photos/250?image=11',
        'https://picsum.photos/250?image=12',
        'https://picsum.photos/250?image=13',
        'https://picsum.photos/250?image=14',
        'https://picsum.photos/250?image=15',
        'https://picsum.photos/250?image=16',
        'https://picsum.photos/250?image=17',
        'https://picsum.photos/250?image=18',
      ]);
      emit(CatsCompleted(response));
    } catch (e) {
      emit(CatsError(e.toString()));
    }
  }

  List<String> catsPhotoUrl = [];
}
