{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://tukaani.org/xz/xz-5.2.9.tar.xz
sha:287ef163e7e57561e9de590b2a9037457af24f03a46bbd12bf84f3263679e8d2
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
