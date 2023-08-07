import 'package:excercise_bloc/bloc/contact_bloc.dart';
import 'package:excercise_bloc/screen/add_user.dart';
import 'package:excercise_bloc/screen/edit_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Future.microtask(
        () => BlocProvider.of<ContactBloc>(context).add(GetContact()));
    super.initState;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const addUser(),
              ));
            }),
            appBar: AppBar(
              title: const Text('contact'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<ContactBloc, ContactState>(
                builder: (context, state) {
                  if (state is ContactLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ContactLoad) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          final data = state.contacts[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditUserScreen(
                                  contact: data,
                                  index: index,
                                ),
                              ));
                            },
                            child: ListTile(
                              trailing: IconButton(
                                  onPressed: () {
                                    BlocProvider.of<ContactBloc>(context)
                                        .add(DeleteUser(idContact: data.id!));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Contact Berhasil Dihapus")),
                                    );
                                  },
                                  icon: const Icon(Icons.delete)),
                              leading: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.green),
                                alignment: Alignment.center,
                                child: Text(data.name[0].toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              title: Text(
                                data.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(data.phone),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount: state.contacts.length);
                  } else if (state is ContactFailure) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  }
                  return Container();
                },
              ),
            )));
  }
}
