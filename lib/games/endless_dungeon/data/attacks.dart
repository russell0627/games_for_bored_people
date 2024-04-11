enum AttackInput {
  tap,
  verticalSwipe,
  horizontalSwipe,
  hold;
}

class Attack {
  final String name;
  final int damage;
  final List<AttackInput> inputs;
  final int maxCooldown;

  Attack({
    required this.name,
    required this.damage,
    required this.inputs,
    required this.maxCooldown,
  });
}

final Map<String, Attack> attacks = {
  "1" : Attack(name: "1", damage: 1, inputs: [AttackInput.tap], maxCooldown: 1),
  "2" : Attack(name: "2", damage: 1, inputs: [AttackInput.tap], maxCooldown: 2),
  "3" : Attack(name: "3", damage: 1, inputs: [AttackInput.tap], maxCooldown: 3),
  "3" : Attack(name: "3", damage: 1, inputs: [AttackInput.tap], maxCooldown: 0),
};