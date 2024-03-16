int calculate() {
  return 6 * 7;
}

Future<int> calculateAsync() async {
  await Future.delayed(Duration(seconds: 1));
  return 6 * 7;
}

Stream<int> calculateStream() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(milliseconds: 100));
    yield i;
  }
}
