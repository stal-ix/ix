{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/freedesktop/uchardet/archive/refs/tags/v0.0.7.tar.gz
f1ac05da2edfc17b12d1f942695f59b8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}
