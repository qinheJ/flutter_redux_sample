import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/redux/actions/todo.dart';
import 'package:flutter_app_redux/services/main.dart';

class TodoApi {
  static fetchTodoList() {
    final apiFuture = Services.rest.get('/api/v1/todo');

    Services.asyncRequest(
        apiFuture,
        TodoListRequestAction(),
        (json) => TodoListSuccessAction(payload: TodoList.fromJson(json)),
        (errorInfo) => TodoListFailureAction(errorInfo: errorInfo));
  }

  static fetchTodoDetail(String id) {
    final apiFuture = Services.rest.get('/api/v1/todo/$id');

    Services.asyncRequest(
        apiFuture,
        TodoDetailRequestAction(),
        (json) => TodoDetailSuccessAction(payload: Todo.fromJson(json)),
        (errorInfo) => TodoDetailFailureAction(errorInfo: errorInfo));
  }

  static deleteTodoList(String id) {
    final apiFuture = Services.rest.delete('/api/v1/todo/$id');
    Services.asyncRequest(
        apiFuture,
        TodoDeleteRequestAction(),
        (json) => TodoDeleteSuccessAction(payload: Todo.fromJson(json)),
        (errorInfo) => TodoDeleteFailureAction(errorInfo: errorInfo));
  }

  static postTodoList() {
    final apiFuture = Services.rest.post('/api/v1/todo');
    Services.asyncRequest(
        apiFuture,
        TodoPostRequestAction(),
        (json) => TodoPostSuccessAction(payload: Todo.fromJson(json)),
        (errorInfo) => TodoPostFailureAction(errorInfo: errorInfo));
  }

  static updateTodoList() {
    final apiFuture = Services.rest.post('path');
    Services.asyncRequest(
        apiFuture,
        TodoUpdateRequestAction(),
        (json) => TodoUpdateSuccessAction(payload: Todo.fromJson(json)),
        (errorInfo) => TodoUpdateFailureAction(errorInfo: errorInfo));
  }
}
