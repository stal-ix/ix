{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/skia/lite
{% endblock %}

{% block name %}
skiasvg
{% endblock %}

{% block sources %}
ss.cpp
{% endblock %}
