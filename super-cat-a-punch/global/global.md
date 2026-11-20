# Global

Autoloaded singletons available everywhere in the project.

## Structure

```
global/
├── game.gd     # Game singleton. Stores runtime state: current level (lsp) and player health (hp).
└── utils.gd    # Utils singleton. Handles save and load game data to/from a binary file.
```
