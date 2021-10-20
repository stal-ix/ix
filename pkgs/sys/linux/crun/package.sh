{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/containers/crun/releases/download/1.2/crun-1.2.tar.xz
# md5 cbfee6db4d034bfa62effe695da2bbd6
{% endblock %}

{% block deps %}
# bld lib/intl lib/yajl lib/cap lib/seccomp lib/argp/standalone
# bld dev/build/make dev/build/pkg-config dev/lang/python/3/minimal
# bld env/std
{% endblock %}

{% block coflags %}
--disable-systemd
{% endblock %}
