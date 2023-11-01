import 'package:get/get.dart';
import '../usecase/usecases.dart';

import '../controller/controller.dart';
import '../data/api.dart';
import '../data/repository.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller(UseCases(Repository(Api()))),
        permanent: true);
  }
}
