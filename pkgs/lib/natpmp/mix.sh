{% extends '//die/make.sh' %}

{% block fetch %}
http://miniupnp.free.fr/files/download.php?file=libnatpmp-20150609.tar.gz
sha:e1aa9c4c4219bc06943d6b2130f664daee213fb262fcb94dd355815b8f4536b0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=clang
INSTALLPREFIX=${out}
{% endblock %}

{% block build %}
{{super()}}
>natpmpc-shared
{% endblock %}
