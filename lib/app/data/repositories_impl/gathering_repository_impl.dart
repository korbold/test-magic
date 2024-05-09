import 'package:test_r/app/data/sources/gathering_source.dart';
import 'package:test_r/app/domain/entities/gathering_entity.dart';
import 'package:test_r/app/domain/repositories/gathering_respository.dart';
import 'package:test_r/core/resources/data_state.dart';

class GatheringRepositoryImpl implements GatheringRepository {
  final GatheringSource _gatheringSource;

  GatheringRepositoryImpl({required GatheringSource gatheringSource}) : _gatheringSource = gatheringSource;

  @override
  Future<DataState<List<GatheringEntity>>> getGatheringList() async {
    return await _gatheringSource.getGatheringList();
  }
}
