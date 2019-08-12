import 'package:rxdart/rxdart.dart';

import './value_transformer.dart';

//This is going to be used as Global.
final bloc = Bloc();

class Bloc extends Object with ValueTransformer implements BaseBloc {
  var _radioController = BehaviorSubject<String>();
  var _themeController = BehaviorSubject<String>();
  var _searchValController = BehaviorSubject<String>();

  Function(String) get feedStatus => _radioController.sink.add;
  Function(String) get sinkColorName => _themeController.sink.add;
  Function(String) get feedSearchVal => _searchValController.sink.add;

  Stream<String> get recieveStatus =>
      _radioController.stream.transform(transformValue);
  Stream<String> get recieveColorName => _themeController.stream;
  Stream<String> get recieveSearchVal => _searchValController.stream;

  @override
  dispose() {
    _radioController?.close();
    _themeController?.close();
    _searchValController?.close();
  }
}

class BaseBloc {
  dispose() {}
}