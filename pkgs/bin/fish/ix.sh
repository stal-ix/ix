{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/fish-shell/fish-shell/archive/refs/tags/3.5.0.tar.gz
sha:63263c97a65f87acb6460bb13215c6a8f002e91bde6c26355aa14661f95ada9f
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/python
bld/gettext
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): fixit'
{% endblock %}
