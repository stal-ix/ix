base64 -d << EOF | python3 - "bootstrap-{{mix.platform.target.os}}-{{mix.platform.target.arch}}-clang-${CLANG_VERSION}.tar.gz"
{% include 'build.py/base64' %}
EOF
