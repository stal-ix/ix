{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/tsl0922/ttyd/archive/refs/tags/1.7.3.tar.gz
sha:c9cf5eece52d27c5d728000f11315d36cb400c6948d1964a34a7eae74b454099
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
