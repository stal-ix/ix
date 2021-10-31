{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/automake/automake-1.16.3.tar.xz
# md5 c27f608a4e1f302ec7ce42f1251c184e
{% endblock %}

{% block deps %}
# lib dev/build/autoconf/2.71/mix.sh
# lib dev/lang/perl5/mix.sh
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
# run dev/build/libtool/mix.sh
# run dev/lang/m4/mix.sh
{% endblock %}
