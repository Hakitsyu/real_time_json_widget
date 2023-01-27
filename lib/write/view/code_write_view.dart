import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highlight/languages/json.dart';
import 'package:real_time_json_widget/cubit/upgradeable_cubit.dart';
import 'package:flutter_highlight/themes/darcula.dart';

class CodeWriteView<TCubit extends UpgradeableCubit<String>> extends StatelessWidget {
  static const int _maxLines = 20;
  late CodeController _codeController;

  CodeWriteView({super.key}) {
    _codeController = CodeController(
      language: json,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CodeTheme(
        data: const CodeThemeData(styles: darculaTheme),
        child: CodeField(
          keyboardType: TextInputType.multiline,
          maxLines: _maxLines,
          onChanged: (text) => context.read<TCubit>().update(text), 
          controller: _codeController,
        )
      )
    );
  }

}