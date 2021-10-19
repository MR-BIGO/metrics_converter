// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, unused_field, prefer_final_fields
import 'package:converter_flutter/Logic/smart_file.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _enteredAmount = 0;
  String? _toMetrics;
  String? _fromMetrics;
  double _convertedAmount = 0;
  FocusNode _focusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

  final List<String> _metrics = [
    'CM',
    'M',
    'KM',
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Listener(
      onPointerDown: (_) => _focusNode.unfocus(),
      child: Scaffold(
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              'Metrics Converter',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Number:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Center(
                      child: TextField(
                        focusNode: _focusNode,
                        controller: _textEditingController,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            var amount = double.tryParse(text);
                            if (amount != null) {
                              _enteredAmount = amount;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Stack(children: [
                  Container(
                    height: deviceSize.height / 2.0,
                    decoration: const ShapeDecoration(
                        color: Color(0xFFBBDEFB),
                        shape: CircleBorder(side: BorderSide.none)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'From:',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontStyle: FontStyle.italic),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                width: 100,
                                height: 45,
                                child: Center(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      selectedItemBuilder: (_) => _metrics
                                          .map((e) => Center(child: Text(e)))
                                          .toList(),
                                      iconEnabledColor: Colors.blue,
                                      value: _fromMetrics,
                                      borderRadius: BorderRadius.circular(35),
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 18),
                                      items: _metrics
                                          .map(
                                            (metric) =>
                                                DropdownMenuItem<String>(
                                              value: metric,
                                              child: Text(
                                                metric,
                                                style: const TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _fromMetrics = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'To:',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              width: 100,
                              height: 45,
                              child: Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    selectedItemBuilder: (_) => _metrics
                                        .map((e) => Center(child: Text(e)))
                                        .toList(),
                                    iconEnabledColor: Colors.blue,
                                    value: _toMetrics,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    style: const TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                    items: _metrics
                                        .map(
                                          (metric) => DropdownMenuItem<String>(
                                            value: metric,
                                            child: Text(
                                              metric,
                                              style: const TextStyle(
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        _toMetrics = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Result:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 20),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                        child: Text(
                          _convertedAmount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: 200,
                            child: FloatingActionButton(
                                child: Text('CONVERSION',
                                    style: TextStyle(fontSize: 20)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(35.0))),
                                onPressed: () {
                                  if (_fromMetrics == null ||
                                      _toMetrics == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please, Fill Every Field'),
                                      ),
                                    );
                                  } else {
                                    setState(() {
                                      _convertedAmount = calculations()
                                          .convertTo(_enteredAmount,
                                              _fromMetrics, _toMetrics);
                                    });
                                  }
                                }),
                          )),
                      Container(
                          width: 200,
                          child: FloatingActionButton(
                            child:
                                Text('RESET', style: TextStyle(fontSize: 20)),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35.0))),
                            onPressed: () {
                              setState(() {
                                _focusNode.unfocus();
                                _textEditingController.clear();
                                _enteredAmount = 0;
                                _toMetrics = null;
                                _fromMetrics = null;
                                _convertedAmount = 0;
                              });
                            },
                          ))
                    ],
                  ))
            ],
          )),
    );
  }
}
