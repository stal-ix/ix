{% extends '//util/env.py' %}

{% block env %}
export CLANG_TARGET="--target={{mix.platform.target.arch}}-{{mix.platform.target.vendor}}-{{mix.platform.target.os}}"
export CPPFLAGS="-nostdinc $CLANG_TARGET $CPPFLAGS"
export CFLAGS="-fcolor-diagnostics $CFLAGS"
export CXXFLAGS="-fcolor-diagnostics -Wno-stdlibcxx-not-found $CXXFLAGS"
export LDFLAGS="-nostdlib++ -fcolor-diagnostics $CLANG_TARGET $LDFLAGS"
{% endblock %}
