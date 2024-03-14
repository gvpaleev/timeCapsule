import 'package:TimeCapsule/features/old/person_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindPersonScreen extends StatelessWidget {
  const FindPersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: 'fab3',
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.keyboard_backspace),
        ),
        body: Body());
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '/findPerson',
      child: BlocBuilder<PersonCardsBloc, PersonCardsState>(
        builder: (context, state) {
          PersonCardsBloc bloc = BlocProvider.of<PersonCardsBloc>(context);
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                TextField(
                  onChanged: (value) {
                    bloc.add(PersonCardsFindEvent(searchElement: value));
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                  ),
                ),
                Expanded(
                  child: ListView(children: [
                    ...(state.personsSorted ?? []).map((person) => Container(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  person.urlIcon ?? 'Loading'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(person.name ?? 'Loading'),
                                            Text(person.description
                                                    .split(';')[0] ??
                                                'Loading')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )))))
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
