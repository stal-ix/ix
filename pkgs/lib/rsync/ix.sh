{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/librsync/librsync/releases/download/v2.3.3/librsync-2.3.3.tar.gz
sha:1a79a74173fe385bb59e6ff5be80ac33ab654f9fcc7a9beba37d875ecba88a39
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
