{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rfjakob/earlyoom/archive/refs/tags/v1.8.1.tar.gz
sha:d7d180353216c064a99619e20e3071ac838e6642221d197fd685e6a0cc8bb032
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
bld/fake(tool_name=chcon)
bld/fake(tool_name=systemctl)
{% endblock %}

{% block make_flags %}
BINDIR=/bin
SYSCONFDIR=${out}/etc
{% endblock %}
