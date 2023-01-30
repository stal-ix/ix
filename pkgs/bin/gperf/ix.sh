{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz
md5:9e251c0a618ad0824b51117d5d9db87e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block setup %}
export CFLAGS="-Wno-register ${CFLAGS}"
{% endblock %}
