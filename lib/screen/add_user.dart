import 'package:excercise_bloc/bloc/contact_bloc.dart';
import 'package:excercise_bloc/data/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addUser extends StatefulWidget {
  const addUser({super.key});

  @override
  State<addUser> createState() => _addUserState();
}

class _addUserState extends State<addUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Center(
        child: Form(
          key: _formkey,
          child: Container(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  maxLength: 20,
                  decoration: InputDecoration(
                      hintText: 'username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: phoneController,
                    maxLength: 20,
                    decoration: InputDecoration(
                        hintText: 'phone number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)))),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ContactBloc>(context).add(AddUser(
                            contact: ContactModel(
                                name: nameController.text,
                                phone: phoneController.text)));
                      },
                      child: const Text('input user ')),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
