{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/seccomp/libseccomp/archive/refs/tags/v2.5.2.tar.gz
7803456cfac52313e109dae6b57264ec
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bld/gperf
bin/auto/conf/2/71
bin/auto/make/1/16
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}
