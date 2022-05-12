{% extends '//mix/autorehell.sh' %}

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

{% block setup %}
export CPPFLAGS="-include zconf.h ${CPPFLAGS}"
{% endblock %}
