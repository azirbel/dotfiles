module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 12,

    // font family with optional fallbacks
    fontFamily: '"Fira Code", "Source Code Pro", Menlo, "DejaVu Sans Mono", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: '#839496',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // color of the text
    foregroundColor: '#839496',

    // terminal background color
    backgroundColor: '#002b36',

    // border color (window, tabs)
    borderColor: '#002b36',

    // custom css to embed in the main window
    css: `
      .tab_active {
        background-color: #001E29;
      }

      .tab_active::before {
        border-bottom: none;
      }

      .tabs_list {
        border-bottom: none;
      }
    `,

    // custom css to embed in the terminal window
    termCSS: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '2px 0',

    // Using https://gist.github.com/nkzawa/970f75de0f9f8b05524d99452dfabd54
    // for vim background=dark compatibility
    colors: [
      '#073642',
      '#dc322f',
      '#859900',
      '#b58900',
      '#268db2',
      '#d33682',
      '#2aa198',
      '#eee8d5',
      '#002b36',
      '#cb4b16',
      '#586e75',
      '#657b83',
      '#839496',
      '#6c71c4',
      '#93a1a1',
      '#fdf6e3'
    ],

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: ''

    // for advanced config flags please refer to https://hyperterm.org/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
