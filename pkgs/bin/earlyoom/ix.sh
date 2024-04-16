{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rfjakob/earlyoom/archive/refs/tags/v1.8.tar.gz
sha:bbb050a2294e60dafc0b129fcec705ef95d9d27f4c9dae1d3b4f25e4f698ae41
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=chcon)
bld/fake(tool_name=systemctl)
{% endblock %}

{% block make_flags %}
BINDIR=/bin
SYSCONFDIR=${out}/etc
{% endblock %}
