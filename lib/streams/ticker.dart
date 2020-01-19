class Ticker {
  Stream<DateTime> tick() {
    return Stream.periodic(
        Duration(seconds: 1) -
            Duration(milliseconds: DateTime.now().millisecond),
        (x) =>  DateTime.now()).takeWhile((x)=>  true);
  }
}
