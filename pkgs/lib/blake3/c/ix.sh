{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
BLAKE3
{% endblock %}

{% block version %}
1.8.7
{% endblock %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/{{self.version().strip()}}.tar.gz
c6782a28842b1c0478524ac06a4f2ede784038ee298d6e2162c0b089c4306a3c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}
