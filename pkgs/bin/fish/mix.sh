{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/fish-shell/fish-shell/archive/refs/tags/3.4.1.tar.gz
sha:5047c50180b564f24dbd4100e0249924d75c15447852f34279c59080c834ead5
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
