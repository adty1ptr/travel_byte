import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/model.dart';
import '../services/destination_service.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestinations() async {
    try {
      emit(DestinationLoading());

      await Future.delayed(const Duration(seconds: 2));
      List<DestinationModel> destinations =
          DestinationService().dummyDestinations;
      // List<DestinationModel> destinations =
      //     await DestinationService().fetchDestinations().then((value) => value);

      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}
