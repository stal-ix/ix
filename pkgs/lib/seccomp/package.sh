{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/seccomp/libseccomp/archive/refs/tags/v2.5.2.tar.gz
# md5 7803456cfac52313e109dae6b57264ec
{% endblock %}

{% block deps %}
# bld lib/linux
# bld dev/build/make dev/tool/gperf dev/build/automake/1.16.3 env/std
{% endblock %}

{% block autoreconf %}
dash ./autogen.sh
{% endblock %}
