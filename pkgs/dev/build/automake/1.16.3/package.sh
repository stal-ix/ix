{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/automake/automake-1.16.3.tar.xz
# md5 c27f608a4e1f302ec7ce42f1251c184e
{% endblock %}

{% block deps %}
# lib dev/build/autoconf/2.71/package.sh
# lib dev/lang/perl5/package.sh
# bld dev/build/make/package.sh
# bld env/std/package.sh
# run dev/build/libtool/package.sh
# run dev/lang/m4/package.sh
{% endblock %}
