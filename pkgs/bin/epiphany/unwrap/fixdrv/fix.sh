set -xue

mv bin/WebKitWebProcess bin/WebKitWebProcess.bin
cat << EOF > bin/WebKitWebProcess
#!/usr/bin/env sh
set -xue
(
set -xue
#export LIBGL_DEBUG=1
#export MESA_DEBUG=1
#export DL_STUB_DEBUG=1
#export EGL_LOG_LEVEL=debug
export VK_LOADER_DEBUG=all
export WAYLAND_DEBUG=1
env
#flock /home/pg gdb -batch -ex 'run' -ex 'bt' --args
WebKitWebProcess.bin "\${@}"
) >& /home/pg/log.\$\$
exit 0
EOF
chmod +x bin/WebKitWebProcess
