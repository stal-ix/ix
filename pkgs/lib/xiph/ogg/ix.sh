{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ogg
{% endblock %}

{% block version %}
1.3.6
{% endblock %}

{% block fetch %}
https://gitlab.xiph.org/xiph/ogg/-/archive/v{{self.version().strip()}}/ogg-v{{self.version().strip()}}.tar.bz2
5044207f8175218300dc88178ef6bdccb21bc71eec8c766fe7b3193d566350d1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
