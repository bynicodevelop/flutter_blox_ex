import 'package:app_state_mamagment/repositories/abstracts/inc_respository.dart';

class IncImplRespository extends IncRepository {
  int _inc = 0;

  @override
  int get inc => _inc;

  @override
  increment() => _inc++;
}
