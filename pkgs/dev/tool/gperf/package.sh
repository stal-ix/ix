{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url http://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz
# md5 9e251c0a618ad0824b51117d5d9db87e
{% endblock %}

{% block deps %}
# bld lib/cxx
# bld dev/build/make env/std
{% endblock %}
