import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final maskPhone = MaskTextInputFormatter(
  mask: "(##)#####-####",
  filter: {"#": RegExp(r'[0-9]')},
);
final maskBirthday = MaskTextInputFormatter(
  mask: "##/##/####",
  filter: {"#": RegExp(r'[0-9]')},
);
final maskCpf = MaskTextInputFormatter(
  mask: "###-###-###-##",
  filter: {"#": RegExp(r'[0-9]')},
);