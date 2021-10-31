{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/seccomp/libseccomp/archive/refs/tags/v2.5.2.tar.gz
# md5 7803456cfac52313e109dae6b57264ec
{% endblock %}

{% block deps %}
# bld lib/linux/package.sh
# bld dev/build/make/package.sh
# bld dev/tool/gperf/package.sh
# bld dev/build/automake/1.16.3/package.sh
# bld env/std/package.sh
{% endblock %}

{% block autoreconf %}
dash ./autogen.sh
{% endblock %}
