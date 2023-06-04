import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

//Takes a Stream of Events as input and transforms them into a Stream of States as output.
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  //Declare the values here not in the UI Pages
  bool status = false;

  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {
      if (event is DoneTaskEvent) {
        //update the value
        status = true;
        print('Status is Done');
        //Return the state
        emit(StatusValueTrueState(status));
      } else if (event is NotDoneTaskEvent) {
        //update the value
        status = false;
        print('Status is NotDone');
        //Return the state
        emit(StatusValueFalseState(status));
      } else if (event is IsThereTaskEvent) {
        if (status == false) {
          print(status);
          emit(IsThereTaskState(status));
          print('The State is ISThereTask');
        } else {
          status = true;
          emit(StatusValueTrueState(status));
        }
      }
    });
  }
}
