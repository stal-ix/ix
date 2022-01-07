{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/JuliaStrings/utf8proc/archive/refs/tags/v2.7.0.tar.gz
11e307064ed630f6a99d825608a248e4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
box/boot
{% endblock %}
