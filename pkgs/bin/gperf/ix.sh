{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz
sha:588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-register ${CFLAGS}"
{% endblock %}
