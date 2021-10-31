{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz
# md5 08fb04335e2f5e73f23ea4c3adbf0c5f
{% endblock %}

{% block deps %}
# bld lib/cxx/mix.sh
# bld lib/uchardet/mix.sh
# bld dev/lang/perl5/mix.sh
# bld dev/lang/bison/3.7.6/mix.sh
# bld dev/doc/texinfo/mix.sh
# bld dev/build/make/mix.sh
# bld dev/build/pkg-config/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block patch %}
>src/libs/libgroff/new.cpp
{% endblock %}

{% block coflags %}
--with-uchardet=yes
{% endblock %}
