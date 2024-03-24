import 'package:TimeCapsule/features/ViewPersonPage/data/models/person_model.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/person_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/presentation/bloc/persons_bloc.dart';
import 'package:TimeCapsule/features/old/person_card_bloc.dart';
import 'package:TimeCapsule/features/old/widgets/body_person_card_wodget.dart';
import 'package:TimeCapsule/features/old/widgets/header_person_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonViewScreen extends StatelessWidget {
  const PersonViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'fab1',
            onPressed: () {
              // Navigator.pushNamed(context, '/findPerson');
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
              // PersonCardsBloc bloc = BlocProvider.of<PersonCardsBloc>(context);
              // bloc.add(UpdateSendingMessagesEvent(message: ''));
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
  // final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final PersonEntity personModel =
        (ModalRoute.of(context)!.settings.arguments as PersonModel);

    // FocusScope.of(context).requestFocus(focusNode);
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
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
                          image: NetworkImage(personModel.imgUrl),
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
                        Text(personModel.name),
                        // Text(state.activePerson?.description.split(';')[0] ??
                        //     'Loading')
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  child: Text(personModel.description),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
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
                      // focusNode: focusNode,
                      onChanged: (value) {
                        print(value);
                      },
                      maxLength: 256,
                      decoration: InputDecoration(
                        counterText: '',
                        border:
                            InputBorder.none, // Пример границы в виде контура
                        // border: UnderlineInputBorder(), // Пример границы в виде подчеркивания
                        hintText: 'Limit 256 char', // Подсказка в поле ввода
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
                          backgroundColor:
                              Color.fromARGB(255, 255, 255, 255), // Цвет фона
                          foregroundColor: Colors.black, // Цвет текста
                        ),
                        onPressed: () {
                          // UserDateBloc bloc =
                          //     BlocProvider.of<UserDateBloc>(context);
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     // print(state.ownerAddress);
                          //     return BlocProvider<UserDateBloc>.value(
                          //       value: bloc,
                          //       child: AlertPayComment(),
                          //     );

                          //     ;
                          //   },
                          // );
                        },
                        child: Text('save'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          ...(
              //personEntity.comments
              ['ssssssssssssssssssss', 'asddddddddddddddd']).map(
            (e) => Padding(
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
                    Text(e as String)
                    // Text(e.keys.join('')),
                    // Text(e.values.join('')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
