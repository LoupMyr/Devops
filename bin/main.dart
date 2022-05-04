import 'IHM.dart';

void main(List<String> arguments) async {
  IHM.hello();
  await IHM.menu();
  IHM.goodbye();
}
