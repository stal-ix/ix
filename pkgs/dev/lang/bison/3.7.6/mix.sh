{% extends '//dev/lang/bison/template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
d61aa92e3562cb7292b004ce96173cf7
{% endblock %}

{% block lib_deps %}
dev/lang/m4/mix.sh
{% endblock %}

{% block bld_deps %}
lib/intl/mix.sh
dev/lang/flex/mix.sh
dev/lang/perl5/mix.sh
dev/build/help2man/mix.sh
dev/doc/texinfo/mix.sh
{% block bison_bootstrap %}
boot/final/env/bison/mix.sh
{% endblock %}
{{super()}}
{% endblock %}
