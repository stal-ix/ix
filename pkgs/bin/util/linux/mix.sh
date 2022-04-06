{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/util-linux/util-linux/archive/refs/tags/v2.38.tar.gz
sha:f3cf9d165f50f46e5c0a1076d178a75a5ae30463345e9c19335552b249fe0e67
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/pam
lib/intl
lib/slang
lib/linux
lib/magic
lib/curses
lib/cap/ng
{% endblock %}

{% block bld_tool %}
bld/bash
bld/bison
bld/gettext
{% endblock %}

{% block configure_flags %}
--disable-makeinstall-chown
--disable-makeinstall-setuid
{% endblock %}

{% block patch %}
cd sys-utils
bison hwclock-parse-date.y
mv hwclock-parse-date.tab.c hwclock-parse-date.c
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin/* bin/
rm -r sbin
{% endblock %}
