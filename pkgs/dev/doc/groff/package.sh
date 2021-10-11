{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz
# md5 08fb04335e2f5e73f23ea4c3adbf0c5f
{% endblock %}

{% block deps %}
# bld lib/cxx lib/uchardet
# bld dev/lang/perl5 dev/doc/texinfo dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block patch %}
>src/libs/libgroff/new.cpp
{% endblock %}

{% block coflags %}
--with-uchardet=yes
{% endblock %}
