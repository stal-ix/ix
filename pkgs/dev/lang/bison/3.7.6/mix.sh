{% extends '//dev/lang/bison/template.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
# md5 d61aa92e3562cb7292b004ce96173cf7
{% endblock %}

{% block deps %}
# bld lib/intl/mix.sh
# lib dev/lang/m4/mix.sh
# bld dev/lang/flex/mix.sh
# bld dev/lang/perl5/mix.sh
# bld dev/build/make/mix.sh
# bld dev/build/help2man/mix.sh
# bld dev/doc/texinfo/mix.sh
# bld env/std/mix.sh
# bld boot/final/env/bison/mix.sh
{% endblock %}
