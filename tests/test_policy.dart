import '../lib/policy.dart';

void main() {
  const signalcase_1 = Signal(63, 89, 15, 6, 4);
  assert(Policy.score(signalcase_1) == 148);
  assert(Policy.classify(signalcase_1) == 'review');
  const signalcase_2 = Signal(74, 79, 27, 16, 6);
  assert(Policy.score(signalcase_2) == 78);
  assert(Policy.classify(signalcase_2) == 'review');
  const signalcase_3 = Signal(77, 97, 22, 20, 13);
  assert(Policy.score(signalcase_3) == 111);
  assert(Policy.classify(signalcase_3) == 'review');
}
