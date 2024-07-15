import 'package:tasino/core/error/failures.dart';
import 'package:tasino/src/voice/data/models/voice_parameters_model.dart';
import 'package:tasino/src/voice/domain/entities/voice_parameters.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class VoiceLocalDataSource {
  Future<bool> initVoiceParameters();
  Future<VoiceParametersModel> getVoiceParameters();
  Future<bool> setVoiceParameters(VoiceParameters parameters);
  Future<bool> clearVoiceParameters();
  VoiceParameters get voiceParameters;
}

class HiveVoiceLocalDataSourceImpl implements VoiceLocalDataSource {
  HiveVoiceLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<bool> initVoiceParameters() async {
    try {
      Box<dynamic> box = await Hive.openBox('voiceParameters');
      box.put(0, VoiceParametersModel.empty.toJson());
      return true;
    } catch (error) {
      throw LocalFailure(message: error.toString());
    }
  }

  @override
  Future<VoiceParametersModel> getVoiceParameters() async {
    try {
      Box<dynamic> box = await Hive.openBox('voiceParameters');

      return VoiceParametersModel.fromJson(box.getAt(0));
    } catch (error) {
      throw LocalFailure(message: error.toString());
    }
  }

  @override
  Future<bool> setVoiceParameters(VoiceParameters parameters) async {
    try {
      Box<dynamic> box = await Hive.openBox('voiceParameters');

      box.put(0, VoiceParametersModel.fromEntity(parameters).toJson());
      return true;
    } catch (error) {
      throw LocalFailure(message: error.toString());
    }
  }

  @override
  Future<bool> clearVoiceParameters() async {
    try {
      Box<dynamic> box = await Hive.openBox('voiceParameters');
      box.clear();
      return true;
    } catch (error) {
      throw LocalFailure(message: error.toString());
    }
  }

  @override
  VoiceParametersModel get voiceParameters =>
      Hive.box('voiceParameters').isNotEmpty
          ? VoiceParametersModel.fromJson(Hive.box('voiceParameters').getAt(0))
          : VoiceParametersModel.empty;
}
