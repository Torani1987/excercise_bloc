import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc.dart';
import '../data/model/contact.dart';

class EditUserScreen extends StatefulWidget {
  final int index;
  final ContactModel contact;
  const EditUserScreen({required this.index, required this.contact, super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.contact.name;
    phoneController.text = widget.contact.phone;
    widget.index;
    super.initState();
  }

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
          child: Container(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  maxLength: 20,
                  decoration: InputDecoration(
                      hintText: widget.contact.name,
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
                        hintText: widget.contact.phone,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)))),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ContactBloc>(context).add(UpdateUser(
                            idContact: widget.contact.id!,
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
