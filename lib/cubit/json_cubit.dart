
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_json_widget/cubit/upgradeable_cubit.dart';

class JsonCubit extends UpgradeableCubit<String> {
  JsonCubit({String? defaultValue}) : super(defaultValue ?? '');
}