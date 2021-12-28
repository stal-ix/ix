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
dev/tool/gperf
dev/build/auto/conf/2/71
dev/build/auto/make/1/16
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}
