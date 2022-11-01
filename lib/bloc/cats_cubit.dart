import 'package:bloc_state/bloc/cats_repoitory.dart';
import 'package:bloc_state/bloc/cats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsCubit extends Cubit<CatsState> {
  final CatsRepository catRepository;
  CatsCubit(this.catRepository) : super(const CatsInitial());

  Future<void> loadCats() async {
    try {
      emit(const CatsLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      final response= await catRepository.fetchCats();
      emit(CatsCompleted(response));
    } on NetWorkError catch (e) {
      emit(CatsError(e.message));
    }
  }

  List<String> catsPhotoUrl = [];
}
