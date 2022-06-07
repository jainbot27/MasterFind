import 'package:flutter/material.dart';

List<Color> _list = [
  Colors.purple,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.orange
];

List<String> prList = [
  'Purple',
  'Blue',
  'Red',
  'Green',
  'Yellow',
  'Orange'
];


List<int> array = [0, 0, 0, 0];

class gameUI extends FormField<int> {
  gameUI({
    required FormFieldSetter<int> sett,
    required int pos,
    int val = 0,
    AutovalidateMode: AutovalidateMode.always,
  }) : super(
            builder: (FormFieldState<int> state) {
              return Column(
                children: [
                  IconButton(
                      onPressed: () {
                        array[pos] = (array[pos] + 1) % 6;
                        state.didChange((state.value! + 1) % 6);
                      },
                      icon: Icon(Icons.arrow_drop_up)),
                  Container(
                    margin: const EdgeInsets.all(6),
                    child: Icon(
                      Icons.circle_sharp,
                      color: _list[state.value!],
                    ),
                    padding: const EdgeInsets.all(15),
                  ),
                  IconButton(
                      onPressed: () {
                        array[pos] = (array[pos] + 5) % 6;
                        state.didChange((state.value! + 5) % 6);
                      },
                      icon: Icon(Icons.arrow_drop_down))
                ],
              );
            },
            onSaved: sett,
            initialValue: val);
}
