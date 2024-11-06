// For every option, see ~/.config/ags/modules/.configuration/user_options.js
// (vscode users ctrl+click this: file://./modules/.configuration/user_options.js)
// (vim users: `:vsp` to split window, move cursor to this path, press `gf`. `Ctrl-w` twice to switch between)
//   options listed in this file will override the default ones in the above file

const userConfigOptions = {
  "appearance": {
    "barRoundCorners": 0, // 0: No, 1: Yes
    "fakeScreenRounding": 0, // 0: None | 1: Always | 2: When not fullscreen
  },
  'workspaces': {
    'shown': 5,
  },
  'weather': {
    'city': "Faridpur",
    'preferredUnit': "C", // Either C or F
  },
}

export default userConfigOptions;
