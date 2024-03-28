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
lib/sqlite/3
lib/readline
lib/shim/gnu/basename/overlay
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-pam-lastlog2
--disable-makeinstall-chown
--disable-makeinstall-setuid
{% endblock %}

{% block patch %}
{{super()}}
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

{% block configure %}
{{super()}}
# https://lists.gnu.org/archive/html/bug-libtool/2016-06/msg00001.html
sed -e 's|func__fatal_error|func_fatal_error|' -i libtool
{% endblock %}
