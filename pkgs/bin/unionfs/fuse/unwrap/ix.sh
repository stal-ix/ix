{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
unionfs-fuse
{% endblock %}

{% block version %}
3.8
{% endblock %}

{% block fetch %}
https://github.com/rpodgorny/unionfs-fuse/archive/refs/tags/v{{self.version().strip()}}.tar.gz
88482d27a886fefd251af3d5b7123e82b2b5800219e7d61d4f29bfee718bbaac
{% endblock %}

{% block lib_deps %}
lib/c
lib/fuse/3
{% endblock %}
