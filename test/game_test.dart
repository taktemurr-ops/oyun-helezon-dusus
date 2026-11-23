import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_helezon_dusus/oyun_helezon_dusus.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(helezonConfig.title.length, 33);
    expect(helezonConfig.tagline.length, 33);
    for (final s in helezonConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(helezonRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: helezonId, optionalMechanics: helezonRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(helezonRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
