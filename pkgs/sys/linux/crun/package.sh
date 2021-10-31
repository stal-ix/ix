{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/containers/crun/releases/download/1.2/crun-1.2.tar.xz
# md5 cbfee6db4d034bfa62effe695da2bbd6
{% endblock %}

{% block deps %}
# bld lib/intl/package.sh
# bld lib/yajl/package.sh
# bld lib/cap/package.sh
# bld lib/seccomp/package.sh
# bld lib/argp/standalone/package.sh
# bld dev/build/make/package.sh
# bld dev/build/pkg-config/package.sh
# bld dev/lang/python/3/minimal/package.sh
# bld env/std/package.sh
{% endblock %}

{% block coflags %}
--disable-systemd
{% endblock %}
