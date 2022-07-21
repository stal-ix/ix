{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/byacc/byacc-20211224.tgz
sha:7bc42867a095df2189618b64497016298818e88e513fca792cb5adc9a68ebfb8
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
