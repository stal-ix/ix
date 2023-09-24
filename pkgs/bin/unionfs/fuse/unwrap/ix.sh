{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/rpodgorny/unionfs-fuse/archive/refs/tags/v3.4.tar.gz
sha:fc315f13f6ba1a736eab86981dde2ad417926f61cec5eff23bcaeca93235377c
{% endblock %}

{% block lib_deps %}
lib/c
lib/fuse/3
{% endblock %}
