import 'dart:developer';

import 'package:flutter/material.dart';

class TextFieldTutorialView extends StatefulWidget {
  const TextFieldTutorialView({super.key});

  @override
  State<TextFieldTutorialView> createState() => _TextFieldTutorialViewState();
}

class _TextFieldTutorialViewState extends State<TextFieldTutorialView> {
  final TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field Tutorial"),
        backgroundColor: Colors.blue,
      ),
      body: InkWell(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                    isObscure: isObscure, nameController: nameController),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      log(nameController.text);
                    }
                  },
                  child: Text("Submit "),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.isObscure,
    required this.nameController,
  });

  final bool isObscure;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.teal,
      // cursorWidth: 16,
      // cursorHeight: 12,
      obscureText: isObscure,
      // obscuringCharacter: "*",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        }
        if (value.length < 7) {
          return "Enter at least 7 characters";
        }
        return null;
      },
      controller: nameController,
      keyboardType: TextInputType.name,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      decoration: InputDecoration(
          // Hint text is  found in focused only
          hintText: "Enter your email",
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          // labe text is  found in focused and enabled
          labelText: "Email",
          labelStyle: TextStyle(
            color: Colors.teal,
            fontSize: 18,
          ),
          prefixIcon: Icon(
            Icons.email,
          ),
          prefixIconColor: Colors.blue,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: isObscure ? Icon(Icons.lock) : Icon(Icons.remove_red_eye),
          ),
          suffixIconColor: isObscure ? Colors.green : Colors.red,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
            ),
            borderSide: BorderSide(
              color: Colors.brown,
              width: 5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
            borderSide: BorderSide(
              color: Colors.deepOrange,
              width: 8,
            ),
          )),
    );
  }
}
