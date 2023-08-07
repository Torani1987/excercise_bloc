import 'dart:convert';

import 'package:excercise_bloc/common/util/api_helper.dart';
import 'package:excercise_bloc/data/model/contact.dart';

class ContactRepository {
  final ApiHelper apiHelper = ApiHelper();

  Future<List<ContactModel>> getData() async {
    try {
      final response = await apiHelper.getResponse('contact');
      final List<ContactModel> contacts = (jsonDecode(response.body) as List)
          .map((e) => ContactModel.fromJson(e))
          .toList();
      return contacts;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addUser(ContactModel contact) async {
    try {
      await apiHelper.postResponse('contact', contact.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser(ContactModel contact, int idContact) async {
    try {
      await apiHelper.putResponse('contact', contact.toJson(), idContact);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser(int idContact) async {
    try {
      await apiHelper.deleteResponse('contact', idContact);
    } catch (e) {
      rethrow;
    }
  }
}
