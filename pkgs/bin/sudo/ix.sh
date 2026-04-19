{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/sudo-project/sudo/archive/refs/tags/v1.9.17.tar.gz
466f15047151abd2f0d81da3c00765393a4839fd2c6f00e866d27e2252e5d30c
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block cpp_defines %}
_PATH_SUDO_LOGSRVD_PID=\\\"/var/run/sudo/sudo_logsrvd.pid\\\"
_PATH_MV=\\\"/bin/mv\\\"
_PATH_SUDO_TIMEDIR=\\\"/var/run/sudo/ts\\\"
{% endblock %}

{# Redirect install-time dirs into ${out} WITHOUT affecting compile.
 # sudo's Makefile.in expands _PATH_SUDOERS via $(sysconfdir)/sudoers
 # at compile time, so overriding sysconfdir in make_flags would bake
 # a store-relative path into the binary. Confine the overrides to
 # `make install` via make_install_target. #}
{% block make_install_target %}
sysconfdir=${out}/etc
rundir=${out}/var/run/sudo
vardir=${out}/var/db/sudo
iolog_dir=${out}/var/log/sudo-io
relaydir=${out}/var/log/sudo_logsrvd
install
{% endblock %}
