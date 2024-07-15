import 'package:tasino/core/error/failures.dart';
import 'package:tasino/src/voice/data/data_sources/local/voice_local_data_source.dart';
import 'package:tasino/src/voice/domain/entities/voice_parameters.dart';
import 'package:tasino/src/voice/domain/repositories/voice_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VoiceRepositoryImpl implements VoiceRepository {
  final VoiceLocalDataSource voiceLocalDataSource = HiveVoiceLocalDataSourceImpl();
  final FlutterTts tts = FlutterTts();

  @override
  Future<Either<Failure, bool>> clearVoiceParameters() async {
    try {
      final bool result = await voiceLocalDataSource.clearVoiceParameters();
      return Right(result);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to clear voice parameters'));
    }
  }

  @override
  Future<Either<Failure, VoiceParameters>> getVoiceParameters() async {
    try {
      final VoiceParameters parameters =
          await voiceLocalDataSource.getVoiceParameters();
      return Right(parameters);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to get voice parameters'));
    }
  }

  @override
  Future<Either<Failure, bool>> initLanguages() async {
    try {
      tts.setLanguage("es-US");
      return const Right(true);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to init languages'));
    }
  }

  @override
  Future<Either<Failure, bool>> initVoiceParameters() async {
    try {
      final bool result = await voiceLocalDataSource.initVoiceParameters();
      return Right(result);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to init voice parameters'));
    }
  }

  @override
  Future<Either<Failure, bool>> setVoiceParameters(
      VoiceParameters parameters) async {
    try {
      final bool result =
          await voiceLocalDataSource.setVoiceParameters(parameters);
      return Right(result);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to set voice parameters'));
    }
  }

  @override
  Future<Either<Failure, bool>> speak(String text) async {
    try {
      await tts.speak(text);
      return const Right(true);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to speak'));
    }
  }

  @override
  VoiceParameters get voiceParameters => voiceLocalDataSource.voiceParameters;

}
