import 'package:e_sheet/features/wifi_connection/presentation/manager/connection_state.dart';
import 'package:bloc/bloc.dart';
import 'package:nearby_connections/nearby_connections.dart';


class ConnectionCubit extends Cubit<ConnectionStates> {
  ConnectionCubit() : super(const ConnectionIdle());

  setupLocalConnection() async {
    if (await Nearby().checkLocationPermission() &&
        await Nearby().checkBluetoothPermission()&&
        await Nearby().checkLocationEnabled()) {
      emit(const ConnectionPermissionGranted());
    } else {
      emit(const ConnectionNoPermission());
    }
  }

  waitingState(){
    emit(const CreateLocalNetwork());
  }

  activateLocalNetwork(Map<String,String> connectedStudents){
    emit(ConnectionActivate(connectedStudents));
  }

  reloadConnectedStudents(Map<String,String> connectedStudents){
    emit(const ConnectionIdle());
    emit(ConnectionActivate(connectedStudents));
  }

  modifyAttendedStudents(List<Map<String,dynamic>> attendedStudents){
    emit(ModifyAttendedStudents(attendedStudents));
  }

  reloadModifiedStudents(List<Map<String,dynamic>> attendedStudents){
    emit(const ConnectionIdle());
    emit(ModifyAttendedStudents(attendedStudents));
  }

}
