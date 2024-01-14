{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/tenox7/ttyplot/archive/refs/tags/1.6.1.tar.gz
sha:a6d0cfb2ec37ea6b4aaf978a8190ca0f42eacd4841f62da4ea2d93ecefc4dd28
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}
