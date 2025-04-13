{% extends '//die/c/make.sh' %}

{% block version %}
0.3.3
{% endblock %}

{% block fetch %}
https://www.leonerd.org.uk/code/libvterm/libvterm-{{self.version().strip()}}.tar.gz
sha:09156f43dd2128bd347cbeebe50d9a571d32c64e0cf18d211197946aff7226e0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bld/libtool
bld/pkg/config
{% endblock %}
