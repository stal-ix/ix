{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/seccomp/libseccomp/archive/refs/tags/v2.5.2.tar.gz
# md5 7803456cfac52313e109dae6b57264ec
{% endblock %}

{% block bld_deps %}
lib/linux/mix.sh
dev/build/make/mix.sh
dev/tool/gperf/mix.sh
dev/build/automake/1.16.3/mix.sh
env/std/mix.sh
{% endblock %}

{% block autoreconf %}
dash ./autogen.sh
{% endblock %}
