{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
unionfs-fuse
{% endblock %}

{% block version %}
3.4
{% endblock %}

{% block fetch %}
https://github.com/rpodgorny/unionfs-fuse/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:fc315f13f6ba1a736eab86981dde2ad417926f61cec5eff23bcaeca93235377c
{% endblock %}

{% block lib_deps %}
lib/c
lib/fuse/3
{% endblock %}
