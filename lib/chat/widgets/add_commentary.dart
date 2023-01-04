import 'package:flutter/material.dart';

import '../../providers/chat_provider.dart';
import '../../theme/app_theme.dart';

import 'package:flutter/cupertino.dart';
import 'dart:io';

class AddCommentary extends StatefulWidget {
  static const String routeName = '/add-commentary';
  const AddCommentary({Key? key}) : super(key: key);

  @override
  State<AddCommentary> createState() => _AddCommentaryState();
}

class _AddCommentaryState extends State<AddCommentary> {
  void displayDialogIOS(BuildContext context) {
    final idForm = GlobalKey<FormState>();

    showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: SingleChildScrollView(
              child: Form(
                child: FormAddCommentary(
                  key: idForm,
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar',
                      style: TextStyle(color: Colors.red))),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok')),
            ],
          );
        });
  }

  void displayDialogAndroid(BuildContext context) {
    final idForm = GlobalKey<FormState>();

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: const Text('Titulo'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            content: SizedBox(
              height: 200,
              child: Scaffold(
                body: FormAddCommentary(
                  key: idForm,
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar')),
              // TextButton(
              //     onPressed: () => Navigator.pop(context),
              //     child: const Text('Ok')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),

        //  onPressed: () => displayDialogAndroid( context )
        onPressed: () => Platform.isAndroid
            ? displayDialogAndroid(context)
            : displayDialogIOS(context));
  }
}

class FormAddCommentary extends StatefulWidget {
  static const String routeName = '/form-commentary';
  const FormAddCommentary({Key? key}) : super(key: key);

  @override
  State<FormAddCommentary> createState() => _FormAddCommentaryState();
}

class _FormAddCommentaryState extends State<FormAddCommentary> {
  final idForm = GlobalKey<FormState>();

  Map<String, dynamic> newcommentary = {};
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: idForm,
          child: Column(
            children: [
              _addCommentary(),
              TextButton(
                  onPressed: (() {
                    idForm.currentState?.save();
                    ChatProvider().addComment(newcommentary);
                    Navigator.pop(context);
                  }),
                  child: const Text('Add'))
            ],
          )),
    );
  }

  _addCommentary() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
          maxLines: null,
          style: const TextStyle(color: AppTheme.primary),
          onSaved: ((newValue) {
            newcommentary['Commentary'] = newValue;
          }),
          decoration: const InputDecoration(
            hintText: 'Commentary',
            hintStyle: TextStyle(color: AppTheme.primary),
          )),
    );
  }
}
