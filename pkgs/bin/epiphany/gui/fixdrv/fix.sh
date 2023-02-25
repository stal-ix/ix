set -xue

mv bin/WebKitWebProcess bin/WebKitWebProcess.bin
cat << EOF > bin/WebKitWebProcess
#!/usr/bin/env sh
export LIBGL_DEBUG=1
export MESA_DEBUG=1
export MESA_SHADER_CACHE_DISABLE=true
export DL_STUB_DEBUG=1
export EGL_LOG_LEVEL=debug
export RADV_DEBUG=zerovram,info,allbos
export ZINK_DEBUG=sync,noreorder
gdb -batch -ex 'run' -ex 'bt' --args WebKitWebProcess.bin "\${@}" >& /home/pg/log.\$\$
exit 0
EOF
chmod +x bin/WebKitWebProcess
