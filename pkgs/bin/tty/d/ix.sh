{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ttyd
{% endblock %}

{% block version %}
1.7.7
{% endblock %}

{% block fetch %}
https://github.com/tsl0922/ttyd/archive/refs/tags/{{self.version().strip()}}.tar.gz
039dd995229377caee919898b7bd54484accec3bba49c118e2d5cd6ec51e3650
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/uv
lib/json/c
lib/web/sockets
{% endblock %}
