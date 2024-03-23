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
    // FocusScope.of(context).requestFocus(focusNode);
    return BlocBuilder<PersonsBloc, PersonsState>(builder: (context, state) {
      return state.when(initial: () {
        return Container(
          child: const Center(
            child: Text('initial'),
          ),
        );
      }, loading: () {
        return Container(
          child: const Center(
            child: Text('initial'),
          ),
        );
      }, loaded: (persons) {
        return Container(
          child: const Center(
            child: Text('initial'),
          ),
        );
      }, error: () {
        return Container(
          child: const Center(
            child: Text('initial'),
          ),
        );
      });
    });
  }
}
