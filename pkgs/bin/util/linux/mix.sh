{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/util-linux/util-linux/archive/refs/tags/v2.37.2.tar.gz
sha:74e725802a6355bba7288caeca171e0e25d9da2aa570162efbc1397ed924dfa2
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
gnu/gettext
dev/tool/bash
dev/lang/bison/3/8
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}

{% block setup_tools %}
ln -s $(which xgettext) gettext
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
cd ${out}; mv sbin/* bin/; rm -r sbin
{% endblock %}
