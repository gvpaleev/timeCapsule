import 'package:TimeCapsule/shared/bloc/person_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled:
                    true, // Установите значение true, чтобы использовать высоту, равную высоте содержимого
                builder: (BuildContext context) {
                  return FractionallySizedBox(
                    heightFactor:
                        0.95, // Установите значение 0.8 для 80% высоты экрана
                    child: Container(
                      // Содержимое вашего нижнего листа
                      child: Center(
                        child: Text('Это нижний лист'),
                      ),
                    ),
                  );
                },
              );
            },
            backgroundColor: Colors.white,
            child: const Icon(Icons.person_search),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            child: const Icon(Icons.comment),
          ),
        ],
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonCardBloc, PersonCardsState>(
      builder: (context, state) {
        return Container(
            padding: const EdgeInsets.all(16),
            child: ListView(children: [
              Container(
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
                                        state.activePerson?.urlIcon ??
                                            'Loading'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.activePerson?.name ?? 'Loading'),
                                  Text(state.activePerson?.description
                                          .split(';')[0] ??
                                      'Loading')
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            child: Text(
                                state.activePerson?.description.split(';')[1] ??
                                    'Loading'),
                          )
                        ],
                      ))),
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...(state.activePerson?.comments ?? []).map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.keys.join('')),
                              Text(e.values.join('')),
                            ],
                          ),
                        ),
                      )),
                ],
              )
            ]));
      },
    );
  }
}
