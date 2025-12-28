{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
capnproto
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block fetch %}
https://github.com/capnproto/capnproto/archive/refs/tags/v{{self.version().strip()}}.tar.gz
01ab2ba7f52fcc3c51a10e22935aae56f3bc5e99b726b7e507fe6700cb12147d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
