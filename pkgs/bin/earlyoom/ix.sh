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

{# Skip the top-level `install` target — it hardcodes an install into
 # /etc/systemd/system, and stalix has no systemd. Run just the pieces
 # we care about, redirecting BINDIR / MAN1DIR into ${out}. BINDIR in
 # make_flags stays at /bin so the all-stage sed substitution bakes
 # the correct runtime path (/bin/earlyoom) into earlyoom.service /
 # earlyoom.default; this override only applies to install-bin. #}
{% block make_install_target %}
BINDIR=${out}/bin
MAN1DIR=${out}/share/man/man1
install-bin
install-default
install-man
{% endblock %}
