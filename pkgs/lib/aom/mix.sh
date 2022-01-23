{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://aomedia.googlesource.com/aom/+archive/287164de79516c25c8c84fd544f67752c170082a.tar.gz
sem:f4cb2111512a45a6e766e1cc07c17f2f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block unpack %}
mkdir src; cd src; extract0 ${src}/*gz
{% endblock %}

{% block bld_tool %}
bld/perl
bin/nasm
{% endblock %}

{% block cmake_flags %}
ENABLE_EXAMPLES=OFF
ENABLE_TESTS=OFF
ENABLE_TOOLS=ON
{% endblock %}
