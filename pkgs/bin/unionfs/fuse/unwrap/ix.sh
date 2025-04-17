{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
unionfs-fuse
{% endblock %}

{% block version %}
3.6
{% endblock %}

{% block fetch %}
https://github.com/rpodgorny/unionfs-fuse/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e6c9fac4e0f0ca82b3e515ca2c82c07dc51ed6da168c465c4b6f50c47bfeddd7
{% endblock %}

{% block lib_deps %}
lib/c
lib/fuse/3
{% endblock %}
