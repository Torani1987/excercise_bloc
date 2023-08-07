part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class GetContact extends ContactEvent {}

class AddUser extends ContactEvent {
  final ContactModel contact;
  const AddUser({required this.contact});

  @override
  List<Object> get props => [contact];
}

class UpdateUser extends ContactEvent {
  final ContactModel contact;
  final int idContact;
  const UpdateUser({required this.contact, required this.idContact});

  @override
  List<Object> get props => [contact, idContact];
}

class DeleteUser extends ContactEvent {
  final int idContact;
  const DeleteUser({required this.idContact});

  @override
  List<Object> get props => [idContact];
}
