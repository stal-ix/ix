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

{% block setup %}
export OPTFLAGS="${OPTFLAGS} -std=c++2a -O0"
{% endblock %}
