import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excercise_bloc/data/model/contact.dart';
import 'package:excercise_bloc/data/repository/contact_repository.dart';

part 'contact_event.dart';
part 'contact_state.dart';

final ContactRepository contactRepository = ContactRepository();

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial(contacts: [])) {
    on<GetContact>(_getContact);
    on<AddUser>(_addUser);
    on<UpdateUser>(_updateUser);
    on<DeleteUser>(_deleteUser);
  }

  Future<void> _getContact(GetContact event, Emitter<ContactState> emit) async {
    emit(ContactLoading());
    try {
      final List<ContactModel> contacts = await contactRepository.getData();
      emit(ContactLoad(contacts: contacts));
    } catch (e) {
      emit(ContactFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _addUser(AddUser event, Emitter<ContactState> emit) async {
    final state = this.state;

    if (state is ContactLoad) {
      try {
        await contactRepository.addUser(event.contact);
        await _getContact(GetContact(), emit);
      } catch (e) {
        emit(ContactFailure(errorMessage: e.toString()));
      }
    }
  }

  FutureOr<void> _updateUser(
      UpdateUser event, Emitter<ContactState> emit) async {
    final state = this.state;

    if (state is ContactLoad) {
      try {
        await contactRepository.updateUser(event.contact, event.idContact);
        await _getContact(GetContact(), emit);
      } catch (e) {
        emit(ContactFailure(errorMessage: e.toString()));
      }
    }
  }

  FutureOr<void> _deleteUser(
      DeleteUser event, Emitter<ContactState> emit) async {
    final state = this.state;
    if (state is ContactLoad) {
      try {
        await contactRepository.deleteUser(event.idContact);
        await _getContact(GetContact(), emit);
      } catch (e) {
        emit(ContactFailure(errorMessage: e.toString()));
      }
    }
  }
}
