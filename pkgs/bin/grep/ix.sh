{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz
f47fe27049510b2249dba7f862ac1b51
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|#!.*/bin/sh|#!/usr/bin/env sh|' -i ${out}/bin/egrep
sed -e 's|#!.*/bin/sh|#!/usr/bin/env sh|' -i ${out}/bin/fgrep
{% endblock%}
