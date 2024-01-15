{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/tsl0922/ttyd/archive/refs/tags/1.7.4.tar.gz
sha:300d8cef4b0b32b0ec30d7bf4d3721a5d180e22607f9467a95ab7b6d9652ca9b
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/uv
lib/json/c
lib/web/sockets
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
