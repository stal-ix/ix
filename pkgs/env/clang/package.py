{% extends '//util/env.py' %}

{% block env %}
export CLANG_LTO=""
export CLANG_TARGET="--target={{mix.platform.target.arch}}-{{mix.platform.target.vendor}}-{{mix.platform.target.os}}"
export CPPFLAGS="$CLANG_LTO -nostdinc $CLANG_TARGET $CPPFLAGS"
export CFLAGS="$CLANG_LTO -fcolor-diagnostics $CFLAGS"
export CXXFLAGS="$CLANG_LTO -fcolor-diagnostics -Wno-stdlibcxx-not-found $CXXFLAGS"
export LDFLAGS="$CLANG_LTO -nostdlib++ -fcolor-diagnostics $CLANG_TARGET $LDFLAGS"
{% endblock %}
