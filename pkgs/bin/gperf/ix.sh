{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gperf
{% endblock %}

{% block version %}
3.3
{% endblock %}

{% block fetch %}
http://ftp.gnu.org/pub/gnu/gperf/gperf-{{self.version().strip()}}.tar.gz
fd87e0aba7e43ae054837afd6cd4db03a3f2693deb3619085e6ed9d8d9604ad8
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block c_flags %}
-Wno-register
{% endblock %}
