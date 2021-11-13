{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/containers/crun/releases/download/1.2/crun-1.2.tar.xz
cbfee6db4d034bfa62effe695da2bbd6
{% endblock %}

{% block bld_deps %}
lib/intl/mix.sh
lib/yajl/mix.sh
lib/cap/mix.sh
lib/seccomp/mix.sh
lib/argp/standalone/mix.sh
dev/build/python/mix.sh
{{super()}}
{% endblock %}

{% block coflags %}
--disable-systemd
{% endblock %}
