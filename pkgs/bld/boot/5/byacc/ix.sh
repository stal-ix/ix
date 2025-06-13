{% extends '//bin/byacc/yacc/ix.sh' %}

{% block pkg_name %}
byacc
{% endblock %}

{% block version %}
20211224
{% endblock %}

{% block fetch %}
https://invisible-mirror.net/archives/byacc/byacc-{{self.version().strip()}}.tgz
7bc42867a095df2189618b64497016298818e88e513fca792cb5adc9a68ebfb8
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/5/sed
bld/boot/4/env
{% endblock %}
