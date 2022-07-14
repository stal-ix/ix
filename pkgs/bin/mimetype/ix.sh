{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/glib
lib/mimetype
{% endblock %}

{% block name %}
mimetype
{% endblock %}

{% block sources %}
mt.cpp
{% endblock %}
