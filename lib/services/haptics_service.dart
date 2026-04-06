import 'package:vibration/vibration.dart';

class HapticsService {
  static Future<void> breakSeal() async {
    // Heavy haptic thud
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(
        pattern: [0, 100, 50, 200],
        intensities: [0, 128, 0, 255],
      );
    }

    // SFX: Clink/Break
    // Placeholder sound from internet or just skip if no asset
    // await _player.play(AssetSource('sounds/break_seal.mp3'));
  }

  static Future<void> tap() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 50);
    }
  }

  static Future<void> success() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(
        pattern: [0, 50, 50, 50],
        intensities: [0, 100, 0, 200],
      );
    }
  }
}
