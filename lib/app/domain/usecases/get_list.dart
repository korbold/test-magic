import 'package:test_r/app/domain/entities/gathering_entity.dart';
import 'package:test_r/app/domain/repositories/gathering_respository.dart';
import 'package:test_r/core/resources/data_state.dart';
import 'package:test_r/core/usecase/usecase.dart';

class GetList implements UseCase<DataState<List<GatheringEntity>>, void> {
  final GatheringRepository repository;

  GetList({required this.repository});
  @override
  Future<DataState<List<GatheringEntity>>> call({void params}) async {
    return await repository.getGatheringList();
  }
}
