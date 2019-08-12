import 'dart:async';

//This makes sure to update the Status of Color Radio.
mixin ValueTransformer {
  var transformValue = StreamTransformer<String, String>.fromHandlers(
      handleData: (status, sink) {
    if (status == 'true') {
      sink.add('false');
    }
    if (status == 'false') {
      sink.add('true');
    } else {
      print('Something went wrong with Radio Status Sink data');
    }
  });
}
