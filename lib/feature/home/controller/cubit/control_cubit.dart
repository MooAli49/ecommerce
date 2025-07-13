import 'package:flutter_bloc/flutter_bloc.dart';

class ControlCubit extends Cubit<int> {
  ControlCubit() : super(0);
  int get currentIndex => state;

  void changeScreenIndex(int index) {
    emit(index);
  }
}
