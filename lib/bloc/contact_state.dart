part of 'contact_bloc.dart';

sealed class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactState {
  final List<ContactModel> contacts;
  const ContactInitial({required this.contacts});

  @override
  List<Object> get props => [contacts];
}

class ContactLoading extends ContactState {}

class ContactLoad extends ContactState {
  final List<ContactModel> contacts;
  const ContactLoad({required this.contacts});
  @override
  List<Object> get props => [contacts];
}

class ContactFailure extends ContactState {
  final String errorMessage;
  const ContactFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
