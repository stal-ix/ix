{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
capnproto
{% endblock %}

{% block version %}
1.2.0
{% endblock %}

{% block fetch %}
https://github.com/capnproto/capnproto/archive/refs/tags/v{{self.version().strip()}}.tar.gz
763ecaa78e900101bc40c1c3397991413ff26996415b891ca9c310987fbdf3fb
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
