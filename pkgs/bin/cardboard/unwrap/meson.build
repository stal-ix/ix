# SPDX-License-Identifier: GPL-3.0-only
wayland_server = dependency('wayland-server')
xkbcommon = dependency('xkbcommon')
xcb = dependency('xcb', required: get_option('xwayland'))

have_xwayland = false

conf_data = configuration_data()
conf_data.set10('HAVE_XWAYLAND', have_xwayland)

configure_file(output: 'BuildConfig.h', configuration: conf_data)

cardboard_deps = [
  wayland_server,
  xkbcommon,
  server_protos,
]

cardboard_sources = files(
  'Cursor.cpp',
  'IPC.cpp',
  'Keyboard.cpp',
  'Layers.cpp',
  'Output.cpp',
  'OutputManager.cpp',
  'Seat.cpp',
  'Server.cpp',
  'Spawn.cpp',
  'View.cpp',
  'Workspace.cpp',
  'XDGView.cpp',
  'ViewOperations.cpp',
  'ViewAnimation.cpp',
  'SurfaceManager.cpp',
  'main.cpp',
  'commands/dispatch_command.cpp'
)

if have_xwayland
    cardboard_deps += xcb
    cardboard_sources += 'Xwayland.cpp'
endif

subdir('wlr_cpp_fixes')

executable(
  'cardboard',
  cardboard_sources,
  include_directories: [wlr_cpp_fixes_inc, libcardboard_inc],
  dependencies: cardboard_deps,
  link_with: libcardboard,
  install: true
)
