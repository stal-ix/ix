{% extends '//dev/lang/bison/template.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
# md5 d61aa92e3562cb7292b004ce96173cf7
{% endblock %}

{% block deps %}
# bld lib/intl/package.sh
# lib dev/lang/m4/package.sh
# bld dev/lang/flex/package.sh
# bld dev/lang/perl5/package.sh
# bld dev/build/make/package.sh
# bld dev/build/help2man/package.sh
# bld dev/doc/texinfo/package.sh
# bld env/std/package.sh
# bld boot/final/env/bison/package.sh
{% endblock %}
