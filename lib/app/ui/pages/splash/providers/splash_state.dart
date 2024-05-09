import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final bool isPermisionsGranted;

  const SplashState({this.isPermisionsGranted = false});

  SplashState copyWith({
    bool? isPermisionsGranted,
  }) {
    return SplashState(
      isPermisionsGranted: isPermisionsGranted ?? this.isPermisionsGranted,
    );
  }

  @override
  List<Object?> get props => [isPermisionsGranted];
}
