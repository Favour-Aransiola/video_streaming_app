abstract class BaseViewModel extends BaseViewModelInput
    with BaseViewModelOutput {}

abstract class BaseViewModelInput {
  start();
  dispose();
}

abstract class BaseViewModelOutput {}
