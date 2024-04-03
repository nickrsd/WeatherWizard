enum WizardBehavior { wander, idle, cast }

enum WizardAssetPath {
  walkLeft(assetPath: "oldman-l"),
  walkRight(assetPath: "oldman-r"),
  walkUp(assetPath: "oldman-u"),
  walkdown(assetPath: "oldman-d"),
  idleLeft(assetPath: "oldman-idle-l"),
  idleRight(assetPath: "oldman-idle-r"),
  idleUp(assetPath: "oldman-idle-u"),
  idleDown(assetPath: "oldman-idle-d"),
  castFacingAway(assetPath: "oldman-divine-u"),
  castFacingForward(assetPath: "oldman-divine-d");

  const WizardAssetPath({required this.assetPath});

  final String assetPath;
}

class WizardEntity {
  final WizardAssetPath asset;
  final double xTranslationOffset;
  final WizardBehavior behavior;

  WizardEntity(
      {required this.asset,
      required this.xTranslationOffset,
      required this.behavior});
}
