import 'package:flutter_app_redux/redux/reducers/login.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

abstract class ViewModel {
  final Store<AppState> store;

  ViewModel(this.store);
}

class StoreContainer {
  static final Store<AppState> global = reduxStore();
}

AppState reduxReducer(AppState state, action) => AppState(
      login: LoginReducer().reducer(state.login, action),
    );

Store reduxStore() => Store<AppState>(reduxReducer,
    initialState: _initialReduxState(), distinct: true);

@immutable
class AppState {
  final LoginState login;

  const AppState({
    this.login,
  });
}

AppState _initialReduxState() {
  return AppState(
    login: LoginState.initialState(),
  );
}
