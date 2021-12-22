{% extends '//dev/lang/bison/template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
d61aa92e3562cb7292b004ce96173cf7
{% endblock %}

{% block run_deps %}
dev/lang/m4/mix.sh
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
lib/intl/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/m4/mix.sh
dev/lang/flex/mix.sh
dev/tool/perl/mix.sh
dev/doc/help2man/mix.sh
dev/doc/texinfo/mix.sh
{% block bison_bootstrap %}
dev/lang/bison/3/boot/mix.sh
{% endblock %}
{% endblock %}
