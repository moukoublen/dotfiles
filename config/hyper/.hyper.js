"use strict";
// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.
module.exports = {
    config: {
        // choose either `'stable'` for receiving highly polished,
        // or `'canary'` for less polished but more frequent updates
        updateChannel: 'stable',
        // default font size in pixels for all tabs
        fontSize: 16,
        // font family with optional fallbacks
        fontFamily: '"Cascadia Mono PL", monospace',
        // default font weight: 'normal' or 'bold'
        fontWeight: 'normal',
        // font weight for bold characters: 'normal' or 'bold'
        fontWeightBold: 'normal',
        // line height as a relative unit
        lineHeight: 1,
        // letter spacing as a relative unit
        letterSpacing: 0,
        // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
        cursorColor: '#7d2457',
        // terminal text color under BLOCK cursor
        cursorAccentColor: '#bf3989',
        // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
        cursorShape: 'UNDERLINE',
        // set to `true` (without backticks and without quotes) for blinking cursor
        cursorBlink: false,
        // color of the text
        foregroundColor: '#b1bac4',
        // terminal background color
        // opacity is only supported on macOS
        backgroundColor: '#0d1117',
        // terminal selection color
        selectionColor: '#7d2457',
        // border color (window, tabs)
        borderColor: '#6e7681',
        // custom CSS to embed in the main window
        css: '',
        // custom CSS to embed in the terminal window
        termCSS: '',
        // set custom startup directory (must be an absolute path)
        workingDirectory: '',
        // if you're using a Linux setup which show native menus, set to false
        // default: `true` on Linux, `true` on Windows, ignored on macOS
        showHamburgerMenu: '',
        // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
        // additionally, set to `'left'` if you want them on the left, like in Ubuntu
        // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
        showWindowControls: '',
        // custom padding (CSS format, i.e.: `top right bottom left`)
        padding: '12px 14px',
        // the full list. if you're going to provide the full color palette,
        // including the 6 x 6 color cubes and the grayscale map, just provide
        // an array here instead of a color map object
        colors: {
            black:        '#30363d',
            lightBlack:   '#6e7681',
            white:        '#f0f6fc',
            lightWhite:   '#FFFFFF',
            red:          '#da3633',
            lightRed:     '#f85149',
            green:        '#238636',
            lightGreen:   '#2ea043',
            yellow:       '#9e6a03',
            lightYellow:  '#bb8009',
            blue:         '#1f6feb',
            lightBlue:    '#388bfd',
            magenta:      '#8957e5',
            lightMagenta: '#a371f7',
            cyan:         '#bf4b8a',
            lightCyan:    '#db61a2',
            limeGreen:    '#3fb950',
            lightCoral:   '#F78166',
        },
        shell: '/usr/bin/bash',
        // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
        // by default `['--login']` will be used
        shellArgs: ['--login'],
        // for environment variables
        env: {},
        // Supported Options:
        //  1. 'SOUND' -> Enables the bell as a sound
        //  2. false: turns off the bell
        bell: 'false',
        // An absolute file path to a sound file on the machine.
        // bellSoundURL: '/path/to/sound/file',
        // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
        copyOnSelect: false,
        // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
        defaultSSHApp: true,
        // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
        // selection is present (`true` by default on Windows and disables the context menu feature)
        quickEdit: false,
        // choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
        // or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
        // (inside tmux or vim with mouse mode enabled for example).
        macOptionSelectionMode: 'vertical',
        // Whether to use the WebGL renderer. Set it to false to use canvas-based
        // rendering (slower, but supports transparent backgrounds)
        webGLRenderer: true,
        // keypress required for weblink activation: [ctrl|alt|meta|shift]
        // todo: does not pick up config changes automatically, need to restart terminal :/
        webLinksActivationKey: '',
        // if `false` (without backticks and without quotes), Hyper will use ligatures provided by some fonts
        disableLigatures: true,
        // set to true to disable auto updates
        disableAutoUpdates: false,
        // set to true to enable screen reading apps (like NVDA) to read the contents of the terminal
        screenReaderMode: false,
        // set to true to preserve working directory when creating splits or tabs
        preserveCWD: true,
        // for advanced config flags please refer to https://hyper.is/#cfg
    },
    // a list of plugins to fetch and install from npm
    // format: [@org/]project[#version]
    // examples:
    //   `hyperpower`
    //   `@company/project`
    //   `project#1.0.1`
    plugins: [],
    // in development, you can create a directory under
    // `~/.hyper_plugins/local/` and include it here
    // to load it and avoid it being `npm install`ed
    localPlugins: [],
    keymaps: {
        "window:devtools": "ctrl+shift+i",
        "window:reload": "ctrl+shift+r",
        "window:reloadFull": "ctrl+shift+f5",
        "window:preferences": "ctrl+,",
        "window:hamburgerMenu": "alt+f",
        "zoom:reset": "ctrl+0",
        "zoom:in": "ctrl+=",
        "zoom:out": "ctrl+-",
        "window:new": "ctrl+shift+n",
        "window:minimize": "ctrl+shift+m",
        "window:zoom": "ctrl+shift+alt+m",
        "window:toggleFullScreen": "f11",
        "window:close": "ctrl+shift+q",
        "tab:new": "cmd+t",
        "tab:next": [
            "ctrl+shift+]",
            "ctrl+shift+right",
            "ctrl+alt+right",
            "ctrl+tab"
        ],
        "tab:prev": [
            "ctrl+shift+[",
            "ctrl+shift+left",
            "ctrl+alt+left",
            "ctrl+shift+tab"
        ],
        "tab:jump:prefix": "ctrl",
        "pane:next": "ctrl+pageup",
        "pane:prev": "ctrl+pagedown",
        "pane:splitRight": "cmd+r",
        "pane:splitDown": "cmd+d",
        "pane:close": "ctrl+shift+w",
        "editor:undo": "ctrl+shift+z",
        "editor:redo": "ctrl+shift+y",
        "editor:cut": "ctrl+shift+x",
        "editor:copy": "cmd+c",
        "editor:paste": "cmd+v",
        "editor:selectAll": "ctrl+shift+a",
        "editor:search": "ctrl+shift+f",
        "editor:search-close": "esc",
        "editor:movePreviousWord": "ctrl+left",
        "editor:moveNextWord": "ctrl+right",
        "editor:moveBeginningLine": "home",
        "editor:moveEndLine": "end",
        "editor:deletePreviousWord": "ctrl+backspace",
        "editor:deleteNextWord": "ctrl+del",
        "editor:deleteBeginningLine": "ctrl+home",
        "editor:deleteEndLine": "ctrl+end",
        "editor:clearBuffer": "cmd+shift+k",
        "editor:break": "ctrl+c",
        "plugins:update": "ctrl+shift+u"
    },
};
//# sourceMappingURL=config-default.js.map
