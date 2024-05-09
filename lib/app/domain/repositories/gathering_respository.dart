import 'package:test_r/app/domain/entities/gathering_entity.dart';
import 'package:test_r/core/resources/data_state.dart';

abstract class GatheringRepository {
  Future<DataState<List<GatheringEntity>>> getGatheringList();
}
