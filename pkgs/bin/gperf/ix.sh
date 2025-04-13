{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gperf
{% endblock %}

{% block version %}
3.2
{% endblock %}

{% block fetch %}
http://ftp.gnu.org/pub/gnu/gperf/gperf-{{self.version().strip()}}.tar.gz
sha:e0ddadebb396906a3e3e4cac2f697c8d6ab92dffa5d365a5bc23c7d41d30ef62
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-register ${CFLAGS}"
{% endblock %}
