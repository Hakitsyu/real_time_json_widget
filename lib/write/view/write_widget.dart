import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_json_widget/cubit/upgradeable_cubit.dart';
import 'package:real_time_json_widget/write/view/code_write_view.dart';
import 'package:real_time_json_widget/write/view/write_view.dart';

class WriteWidget<TCubit extends UpgradeableCubit<String>> extends StatelessWidget {
  const WriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CodeWriteView<TCubit>();
  }
}