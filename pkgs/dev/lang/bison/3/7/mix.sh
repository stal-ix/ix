{% extends '//dev/lang/bison/template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
d61aa92e3562cb7292b004ce96173cf7
{% endblock %}

{% block run_deps %}
dev/lang/m4
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
dev/lang/m4
dev/lang/flex
dev/tool/perl
bin/help2man
bin/texinfo
{% block bison_bootstrap %}
dev/lang/bison/3/boot
{% endblock %}
{% endblock %}
