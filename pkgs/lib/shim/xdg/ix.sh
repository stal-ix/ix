{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block sources %}
xdg_open.h
xdg_open.c
{% endblock %}

{% block env %}
export CPPFLAGS="-include ${out}/include/xdg_open.h \${CPPFLAGS}"
{% endblock %}
