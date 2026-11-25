# Menus

All UI scenes and scripts for navigation and game control.

## Structure

```
menus/
├── menu.gd             # Main menu script. Handles start, quit, and confirmation dialog.
├── menu.tscn           # Main menu scene with Start and Quit buttons.
├── level_menu.gd       # Level select script. Connects each level button to its scene transition.
├── level_menu.tscn     # Level select scene with buttons for levels 1–4 and a back button.
├── pause_menu.gd       # Pause menu script. Handles toggle, resume, main menu, and quit with confirmation dialogs.
└── pause_menu.tscn     # Pause menu scene (CanvasLayer) with resume, main menu, and quit buttons.
```

## Usage
Menus are to be packed or extended when expected to be used. Pause menu is the only one that will apply for most moments.
Cancellations and quiting buttons lead to confirmation pop ups.
Menus are Control or Canvas nodes so that their buttons are navegable with keyboard and game controler (mando?).

## Technical Debt to resolve
- On pause menu: main menu/quit pop up is not cancellable with ui_cancel or button 1.
- Main menu: quit pop up is not cancellable with ui_cancel or button 1.
