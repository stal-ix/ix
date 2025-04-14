{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gperf
{% endblock %}

{% block version %}
3.2.1
{% endblock %}

{% block fetch %}
http://ftp.gnu.org/pub/gnu/gperf/gperf-{{self.version().strip()}}.tar.gz
sha:ed5ad317858e0a9badbbada70df40194002e16e8834ac24491307c88f96f9702
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-register ${CFLAGS}"
{% endblock %}
