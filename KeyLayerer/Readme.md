# KeyLayerer

This project is an Autohotkey script generator with a frontend that provides users the ability to quickly and graphically configure new layers and layer switches for their keyboard, any keyboard. This provides programmable keyboard functionality for stock boards and should make configuring interesting layers much easier for non-experts.

Contents will include a web interface that allows selection of one of a number of pre-defined keyboard layouts (and potentially customization of the chosen layout) including standard 108 key, tenkeyless, 60%, Ergodox (though of course reprogramming an Ergodox is best done through a compiled teensy hex), etc. I want to ensure that the KL can be more than just key remaps; I specifically want layer functionality.

TODO: 
* web interface with selector for keyboard layout, buttons for saving out code or reading a generated ahk to populate the layout designer, and a place to display the KL. KLs should be designable through clicking keys and interacting with a popup.
* blank layout files
* code generator to produce working AHK scripts from KL layout
* example KL layouts and code

Options for front-end:
* Pure CSS/SASS implementation
* React, Blaze, Angular...?

Maybe:
* generate teensy hex for KLs for Ergodox, other OS Keyboards?

Questions:
* Why the cuss not integrate this with https://github.com/ijprest/keyboard-layout-editor ? I'd need to figure out how to represent the physical key vs. the desired AHK behavior. 


