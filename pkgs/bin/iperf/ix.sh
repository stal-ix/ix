{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/iperf2/iperf-2.1.9.tar.gz
sha:5c0771aab00ef14520013aef01675977816e23bb8f5d9fde016f90eb2f1be788
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
