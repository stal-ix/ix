{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
librsync
{% endblock %}

{% block version %}
2.3.4
{% endblock %}

{% block fetch %}
https://github.com/librsync/librsync/releases/download/v{{self.version().strip()}}/librsync-{{self.version().strip()}}.tar.gz
sha:a0dedf9fff66d8e29e7c25d23c1f42beda2089fb4eac1b36e6acd8a29edfbd1f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
