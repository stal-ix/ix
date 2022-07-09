{% extends '//lib/linux/util/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/z
lib/pam
lib/intl
lib/slang
lib/magic
lib/curses
lib/cap/ng
{% endblock %}

{% block configure_flags %}
{{super()}}
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
