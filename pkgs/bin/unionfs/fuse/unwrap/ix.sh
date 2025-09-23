{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
unionfs-fuse
{% endblock %}

{% block version %}
3.7
{% endblock %}

{% block fetch %}
https://github.com/rpodgorny/unionfs-fuse/archive/refs/tags/v{{self.version().strip()}}.tar.gz
026f5302279110ceb7465e5c9e863cd0319ea0dc32ad253d162cf9db0f5e9a81
{% endblock %}

{% block lib_deps %}
lib/c
lib/fuse/3
{% endblock %}
