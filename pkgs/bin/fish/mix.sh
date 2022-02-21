{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/fish-shell/fish-shell/archive/refs/tags/3.3.1.tar.gz
sha:cc8b6dae684407190cbc9d2b327f0272e8a235f7f60614e0ac2f7d24fdbcde24
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/python
bin/gettext
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): fixit'
{% endblock %}
