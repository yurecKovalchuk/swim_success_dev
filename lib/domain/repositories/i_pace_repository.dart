import 'package:swim_success_dev/domain/models/pace_request.dart';

abstract class IPaceRepository {
  Future<void> submitPace(PaceRequest request);
}
