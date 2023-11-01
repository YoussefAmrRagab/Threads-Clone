import 'package:get/get.dart';
import '../model/usecase/usecases.dart';

import '../controller/controller.dart';
import '../model/data/api.dart';
import '../model/data/repository.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller(UseCases(Repository(Api()))),
        permanent: true);
  }
}
