import 'package:TimeCapsule/features/person_card_bloc.dart';
import 'package:TimeCapsule/widgets/body_person_card_wodget.dart';
import 'package:TimeCapsule/widgets/header_person_card_widget.dart';
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
                    child: HeaderPersonCardWidget(
                      state: state,
                    )),
                const SizedBox(
                  height: 8,
                ),
                BodyPersonCardWodget(
                  focusNode: focusNode,
                  state: state,
                )
              ]));
        },
      ),
    );
  }
}
