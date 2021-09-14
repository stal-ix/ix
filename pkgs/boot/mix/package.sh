# bld shell/dash/minimal dev/lang/clang boot/final/env/tools

build() {
    base64 -d << EOF | python3 - "bootstrap-{{mix.platform.target.os}}-{{mix.platform.target.arch}}-clang-${CLANG_VERSION}.tar.gz" "${CLANG_VERSION}"
{% include 'build.py/base64' %}
EOF
}
