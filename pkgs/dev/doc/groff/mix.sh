{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz
08fb04335e2f5e73f23ea4c3adbf0c5f
{% endblock %}

{% block bld_deps %}
lib/cxx/mix.sh
lib/uchardet/mix.sh
dev/lang/perl5/mix.sh
dev/lang/bison/3.7.6/mix.sh
dev/doc/texinfo/mix.sh
env/autohell/mix.sh
{% endblock %}

{% block patch %}
>src/libs/libgroff/new.cpp
{% endblock %}

{% block coflags %}
--with-uchardet=yes
{% endblock %}
