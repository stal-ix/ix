{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/librsync/librsync/releases/download/v2.3.4/librsync-2.3.4.tar.gz
sha:a0dedf9fff66d8e29e7c25d23c1f42beda2089fb4eac1b36e6acd8a29edfbd1f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
