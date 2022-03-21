import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  final Function(bool) checkedPrivacy;

  const PrivacyPolicyWidget({
    Key? key,
    required this.checkedPrivacy,
  }) : super(key: key);

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  bool checkPrivacy = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: checkPrivacy,
      dense: true,
      onChanged: (bool? value) {
        if (value != null) {
          setState(() => checkPrivacy = value);
          widget.checkedPrivacy(value);
        }
      },
      title: InkWell(
        onTap: (){
          //Go to URL
        },
        child: RichText(
          text: const TextSpan(
            style: TextStyle(
              color: AppColors.textColor,
            ),
            children: [
              TextSpan(text: "Eu li e concordo com os"),
              TextSpan(text: " Termos de Privacidade",
                style: TextStyle(
                  color: Colors.blue
                )
              ),
            ]
          ),
        ),
      ),
    );
  }
}
