{% extends '//die/c/make.sh' %}

{% block pkg_name %}
earlyoom
{% endblock %}

{% block version %}
1.9.0
{% endblock %}

{% block fetch %}
https://github.com/rfjakob/earlyoom/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b2fe5e1e071a5a000b22fb9602c068fd69d09c057f0ba972dfc5d85daf464b2a
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
