# Characters

Base classes and scenes for all characters in the game. Players and enemies inherit from a character base.

## Structure

```
characters/
├── character_base.gd       # Base class (CharacterBase). Handles physics, movement, attacking, damage, and death.
├── character_base.tscn     # Base scene with collision, visuals, hit area, and attack area nodes.
├── players/
│   ├── player_base.gd      # Player base class (PlayerBase). Handles input, directional movement, jumping, and attack input.
│   ├── player_base.tscn    # Player base scene, inherits character_base.tscn.
│   └── player_n/
│       ├── player_n.gd       # Player N's character class. Overrides play_attack() with his specific animation.
│       └── player_n.tscn     # Player N's scene, inherits player_base.tscn.
└── enemies/
    ├── enemy_base.gd       # Enemy base class (EnemyBase). Handles player detection and chase/attack logic.
    ├── enemy_base.tscn     # Enemy base scene, inherits character_base.tscn.
    └── enemy_n/
        ├── enemy_n.gd        # Enemy N's class. Sets speed and attack distance, overrides play_attack().
        └── enemy_n.tscn      # Enemy N's scene, inherits enemy_base.tscn.
```

All in all, Character base serves as a parent for both enemies and players. Players as a parent allows for many players each with their own logic while sharing common processes. Enemies as parent allows for the same.

Internally, we use Godot Grouping for logically arranging both types, so that we can decide actions depending on these groups.

Both share the same internal nodes structures, inheriting some nodes for visuals/assets, Area2Ds and their collision child nodes for simplifying the process of adding and fine-tuning them on each specific node.

Most if not all of the methods are controlled through signals. These will be documented here in the future.
