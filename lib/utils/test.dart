import 'package:flutter/material.dart';

class VideoCall {
  var x;
  VideoCall();

  functionA(var x) {
    print(x);
  }

  functionB(var x) {
    print(x);
  }

  functionC(var x) {
    print(x);
  }

  Widget widgetDefault({customA, customB, customC}) {
    functionA(customA);
    functionB(customB);
    functionC(customC);
    return customA;
  }
}

class Luar {
  VideoCall videoCall = VideoCall();

  var x = 0;
  var y = 1;
  var z = 2;

  methodLuar() {
    videoCall.widgetDefault(
      customA: x,
      customB: y,
      customC: z,
    );
  }

}
