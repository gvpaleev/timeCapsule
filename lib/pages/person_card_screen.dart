import 'package:TimeCapsule/shared/bloc/person_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonCardScreen extends StatelessWidget {
  const PersonCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'fab1',
            onPressed: () {
              Navigator.pushNamed(context, '/findPerson');
            },
            backgroundColor: Colors.white,
            child: const Icon(Icons.person_search),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            heroTag: 'fab2',
            onPressed: () {
              PersonCardsBloc bloc = BlocProvider.of<PersonCardsBloc>(context);
              bloc.add(UpdateSendingMessagesEvent(message: ''));
            },
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
  Body({
    super.key,
  });
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
    return Hero(
      tag: '/',
      child: BlocBuilder<PersonCardsBloc, PersonCardsState>(
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
                              child: Text(state.activePerson?.description
                                      .split(';')[1] ??
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
                    state.message == null
                        ? SizedBox()
                        : Padding(
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
                                  Text(DateTime.now().toString()),
                                  // Text(state.message ?? ''),
                                  TextField(
                                      focusNode: focusNode,
                                      onChanged: (value) {
                                        print(value);
                                      },
                                      maxLength: 256,
                                      decoration: InputDecoration(
                                        counterText: '',
                                        border: InputBorder
                                            .none, // Пример границы в виде контура
                                        // border: UnderlineInputBorder(), // Пример границы в виде подчеркивания
                                        hintText:
                                            'Limit 256 char', // Подсказка в поле ввода
                                      ),
                                      // style: TextStyle(
                                      //     fontSize: 22, color: Colors.blue),
                                      maxLines: 8,
                                      minLines: 1),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(
                                              255, 255, 255, 255), // Цвет фона
                                          foregroundColor:
                                              Colors.black, // Цвет текста
                                        ),
                                        onPressed: () {
                                          // Обработчик нажатия
                                        },
                                        child: Text('save'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
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
      ),
    );
  }
}
