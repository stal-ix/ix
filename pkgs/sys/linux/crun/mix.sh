{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/containers/crun/releases/download/1.2/crun-1.2.tar.xz
# md5 cbfee6db4d034bfa62effe695da2bbd6
{% endblock %}

{% block deps %}
# bld lib/intl/mix.sh
# bld lib/yajl/mix.sh
# bld lib/cap/mix.sh
# bld lib/seccomp/mix.sh
# bld lib/argp/standalone/mix.sh
# bld dev/build/make/mix.sh
# bld dev/build/pkg-config/mix.sh
# bld dev/lang/python/3/minimal/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block coflags %}
--disable-systemd
{% endblock %}
