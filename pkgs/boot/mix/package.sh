# bld shell/dash/minimal dev/lang/clang boot/final/env/tools

build() {
    base64 -d << EOF | python3 - "bootstrap-linux-x86_64-clang-${CLANG_VERSION}.tar.gz"
{% include 'build.py/base64' %}
EOF
}
