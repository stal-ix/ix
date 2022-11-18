{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
{% include '//lib/z/adler/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/z/adler
{% endblock %}

{% block unpack %}
{{super()}}
cd contrib/minizip
{% endblock %}

{% block cpp_missing %}
zconf.h
{% endblock %}
