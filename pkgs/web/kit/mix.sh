{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://webkitgtk.org/releases/webkitgtk-2.34.3.tar.xz
de30c41fb57b2b024417669c22914752
{% endblock %}

{% block lib_deps %}
web/kit/libs(harfbuzz_icu=1)
{% endblock %}

{% block bld_tool %}
dev/tool/perl
dev/tool/ruby
dev/tool/python
{% endblock %}

{% block cmake_flags %}
PORT=GTK
USE_GTK4=ON
{% endblock %}
