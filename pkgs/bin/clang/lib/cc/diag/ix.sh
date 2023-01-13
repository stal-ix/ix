{% extends '//die/env.sh' %}

{% block env %}
export CPPFLAGS="-fcolor-diagnostics ${CPPFLAGS}"
export CFLAGS="-Wno-deprecated -Wno-implicit-int -Wno-int-conversion -Wno-unused-command-line-argument ${CFLAGS}"
export CXXFLAGS="-Wno-stdlibcxx-not-found ${CXXFLAGS}"
{% endblock %}
