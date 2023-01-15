# Gnome configurations and settings

## Gnome Terminal
To apply Gnome Terminal color palette and settings you need to run the `gnome-terminal.bash` script.

```
Usage:
       get [profile name (optional)]
       set [color file] [profile name (optional)]
```


You can choose between 4 color pallettes

* `__terminal-colors.bash` (colors from [Material](https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors))
* `__terminal-colors-primer_dark_dimmed.bash` (colors from [Pimer](https://primer.style/primitives/colors) Dark dimmed pallette)
* `__terminal-colors-primer_dark.bash` (colors from [Primer](https://primer.style/primitives/colors) Dark pallette)
* `__terminal-colors-primer_light.bash` (colors from [Primer](https://primer.style/primitives/colors) Light pallette)

Example:
```bash
cd lib
source __tools.bash
./gnome-terminal.bash set __terminal-colors-primer_dark.bash
```

You can also specify a **profile** (must be already existing) you want to apply the changes to (if none is specified the changes will be applied to default profile)

Example with profile:
```bash
cd lib
source __tools.bash
./gnome-terminal.bash set __terminal-colors-primer_dark_dimmed.bash profile1
```

By running `gnome-terminal.bash` without (or wrong) arguments a help message will be displayed that will contain also all available profiles to choose.

Example
```
$ ./gnome-terminal.bash
Usage:
       get [profile name (optional)]
       set [color file] [profile name (optional)]

Available profiles:
  Unnamed
  Default
  profile1
```
