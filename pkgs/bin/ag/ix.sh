{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
the_silver_searcher
{% endblock %}

{% block version %}
2.2.0
{% endblock %}

{% block fetch %}
https://github.com/ggreer/the_silver_searcher/archive/refs/tags/{{self.version().strip()}}.tar.gz
6a0a19ca5e73b2bef9481c29a508d2413ca1a0a9a5a6b1bd9bbd695a7626cbf9
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/pcre
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-fcommon ${CFLAGS}"
{% endblock %}
