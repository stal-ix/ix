{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/netblue30/firejail/archive/refs/tags/landlock-split.tar.gz
sha:a149c1fc7be77325a301afb986da386855eca1554d71aaf022086f31d04d0a82
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block postinstall %}
:
{% endblock %}
