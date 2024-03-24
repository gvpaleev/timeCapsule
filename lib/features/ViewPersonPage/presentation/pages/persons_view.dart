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
            child: Text('loading'),
          ),
        );
      }, loaded: (persons) {
        return Container(
          child: ListView(
            children: [
              ...(persons ?? []).map(
                (person) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(person.imgUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(person.name),
                                    Text(person.description.split(';')[0])
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }, error: () {
        return Container(
          child: const Center(
            child: Text('error'),
          ),
        );
      });
    });
  }
}
