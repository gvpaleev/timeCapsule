import 'package:TimeCapsule/features/user_date_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyPersonCardWodget extends StatelessWidget {
  var state;
  BodyPersonCardWodget(
      {super.key, required this.focusNode, required this.state});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          // focusNode: focusNode,
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
                              foregroundColor: Colors.black, // Цвет текста
                            ),
                            onPressed: () {
                              UserDateBloc bloc =
                                  BlocProvider.of<UserDateBloc>(context);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // print(state.ownerAddress);
                                  return BlocProvider<UserDateBloc>.value(
                                    value: bloc,
                                    child: AlertPayComment(),
                                  );

                                  ;
                                },
                              );
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
    );
  }
}

class AlertPayComment extends StatelessWidget {
  AlertPayComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDateBloc, UserDataState>(
      listener: (context, state) {
        // TODO: implement listener
        print(state);
      },
      child: BlocBuilder<UserDateBloc, UserDataState>(
        builder: (context, state) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: state.ownerAddress.toString()),
                    ),
                    // SizedBox(
                    //   width: 320.0,
                    //   child: RaisedButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       "Save",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     color: const Color(0xFF1BC0C5),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          );
          // AlertDialog(
          //   backgroundColor: Colors.white,
          //   title: Text("BNB Smart Chain"),
          //   content: SizedBox(
          //     height: 400,
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Wrap(
          //           children: [
          //             Text("Your address:"),
          //             SizedBox(
          //               width: 3,
          //             ),
          //             TextCopyWidget(
          //               text: (state.ownerAddress.toString()) ?? 'Loading...',
          //             ),

          //             // Text("address"),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             Text("Your privatKey:"),
          //             SizedBox(
          //               width: 3,
          //             ),
          //             TextCopyWidget(
          //               text: 'asdasfsdfhavbgfdtfw',
          //             ),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             Text("BNB balance:"),
          //             SizedBox(
          //               width: 3,
          //             ),
          //             Text("0.222123123"),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             Text("USDT balance:"),
          //             SizedBox(
          //               width: 3,
          //             ),
          //             Text("0.222123123"),
          //           ],
          //         ),
          //         SizedBox(
          //           height: 8,
          //         ),
          //         Text('Price for leaving a comment 100 usdt.'),
          //         SizedBox(
          //           height: 8,
          //         ),
          //         Text(
          //             'If you are unclear about what needs to be done, we strongly recommend that you contact a technician.')
          //       ],
          //     ),
          //   ),
          //   actions: [
          //     TextButton(
          //       style: TextButton.styleFrom(
          //         foregroundColor: Colors.black, // Цвет текста кнопки
          //       ),
          //       child: Text("Cancel"),
          //       onPressed: () {
          //         Navigator.of(context).pop();
          //       },
          //     ),
          //     TextButton(
          //       style: TextButton.styleFrom(
          //         foregroundColor: Colors.black, // Цвет текста кнопки
          //       ),
          //       child: Text("Pay"),
          //       onPressed: () {},
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
}

class TextCopyWidget extends StatelessWidget {
  final String text;
  const TextCopyWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: text));
        final snackBar = SnackBar(content: Text('Copied to clipboard'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Text(
        text,
        softWrap: true,
        style: TextStyle(
          // color: Colors
          //     .blue, // Цвет текста, чтобы пользователь понял, что он может быть нажат
          decoration: TextDecoration
              .underline, // Подчеркивание, чтобы пользователь понял, что это интерактивный текст
        ),
      ),
    );
  }
}
