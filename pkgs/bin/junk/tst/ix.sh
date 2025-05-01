{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block name %}
tst
{% endblock %}

{% block sources %}
main.cpp
{% endblock %}

{% block test %}
${out}/bin/tst
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="${CFLAGS} -std=c++2a -O0"
{% endblock %}
