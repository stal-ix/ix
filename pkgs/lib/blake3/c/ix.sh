{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/1.5.5.tar.gz
sha:6feba0750efc1a99a79fb9a495e2628b5cd1603e15f56a06b1d6cb13ac55c618
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}
