import 'package:flutter/material.dart';

class HeaderPersonCardWidget extends StatelessWidget {
  var state;
  HeaderPersonCardWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    image:
                        NetworkImage(state.activePerson?.urlIcon ?? 'Loading'),
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
                  Text(state.activePerson?.description.split(';')[0] ??
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
                state.activePerson?.description.split(';')[1] ?? 'Loading'),
          )
        ],
      ),
    );
  }
}
