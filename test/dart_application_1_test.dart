import 'package:dart_application_1/dart_application_1.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  group(
    'calculateAsync',
    () {
      test('calculateAsync with await', () async {
        expect(await calculateAsync(), 42);
      });

      test('calculateAsync with completion', () {
        expect(calculateAsync(), completion(42));
      });

      test('calculateAsync with expectLater', () async {
        await expectLater(calculateAsync(), completion(42));
      });
    },
  );

  group(
    'calculateStream',
    () {
      test('calculateStream with await', () async {
        expect(
          await calculateStream().toList(),
          <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
        );
      });

      test('calculateStream with expect', () {
        expect(
          calculateStream(),
          emitsInOrder(<int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]),
        );
      });

      test('calculateStream with expectLater', () async {
        await expectLater(
          calculateStream(),
          emitsInOrder(<int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]),
        );
      });

      test('calculateStream with expectLater and await', () async {
        final stream = calculateStream().asBroadcastStream();
        await expectLater(stream, emits(0), skip: false);
        await expectLater(stream, emits(0), skip: true, reason: 'Already emitted');
        await expectLater(stream, emits(1));
        await expectLater(stream, emits(2));
      });
    },
  );

  group(
    'expectAsync',
    () {
      test('expectAsync', () {
        final callback = expectAsync0(() => print('callback'));
        callback();
      });

      test('expectAsync with count', () {
        final callback = expectAsync0(() => print('callback'), count: 2);
        callback();
        callback();
      });

      test('expectAsync with max', () {
        final callback = expectAsync0(() => print('callback'), max: 3);
        callback();
        callback();
      });

      test('expectAsync1', () {
        final callback = expectAsync1((int value) => print('callback $value'), count: 2);
        callback(42);
        callback(24);
      });
    },
  );
}
