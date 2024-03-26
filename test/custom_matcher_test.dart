import 'package:test/test.dart';

bool _isEmail(String str) {
  var emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  return emailRegExp.hasMatch(str);
}

class IsEmail extends Matcher {
  const IsEmail();

  @override
  bool matches(item, Map matchState) {
    return item is String && _isEmail(item);
  }

  @override
  Description describe(Description description) {
    return description.add('a string that looks like an email address');
  }
}

final myEmailMatcher = CustomMatcher('IsEmail', 'a string that looks like an email address', _isEmail);

void main() {
  test('Кастомный matcher для email', () {
    expect('test@example.com', IsEmail());
    expect('not-an-email', isNot(IsEmail()));
  });

  test('Кастомный matcher для email (с CustomMatcher)', () {
    expect('test@example.com', myEmailMatcher);
    expect('not-an-email', isNot(myEmailMatcher));
  });
}
