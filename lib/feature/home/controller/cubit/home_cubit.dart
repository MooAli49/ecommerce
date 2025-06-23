import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int _curruntHomeIndex = 0;
  int get curruntHomeIndex => _curruntHomeIndex;

 
}
