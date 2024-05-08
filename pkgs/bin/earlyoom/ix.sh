{% extends '//die/c/make.sh' %}

{% block version %}
1.8.2
{% endblock %}

{% block fetch %}
https://github.com/rfjakob/earlyoom/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:13869413dc0d973e454854077be7a2049d350f77a97f6911b654e88dc4b20346
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
VERSION={{self.version().strip()}}
SYSCONFDIR=${out}/etc
{% endblock %}
