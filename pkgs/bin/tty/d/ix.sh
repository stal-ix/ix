{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/tsl0922/ttyd/archive/refs/tags/1.7.5.tar.gz
sha:c1334db016e8c05662adf45c450cb65ca101de14d0c6c2490212995f0422d73f
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
