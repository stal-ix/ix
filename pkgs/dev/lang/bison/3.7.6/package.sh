{% extends '//dev/lang/bison/template.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
# md5 d61aa92e3562cb7292b004ce96173cf7
{% endblock %}

{% block deps %}
# bld lib/intl
# lib dev/lang/m4
# bld dev/lang/flex dev/lang/perl5 dev/build/make
# bld dev/build/help2man dev/doc/texinfo env/std boot/final/env/bison
{% endblock %}
