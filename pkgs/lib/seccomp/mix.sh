{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/seccomp/libseccomp/archive/refs/tags/v2.5.2.tar.gz
7803456cfac52313e109dae6b57264ec
{% endblock %}

{% block bld_libs %}
lib/linux/mix.sh
{% endblock %}

{% block bld_tool %}
dev/tool/gperf/mix.sh
dev/build/autoconf/2.71/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
dash ./autogen.sh
{% endblock %}
