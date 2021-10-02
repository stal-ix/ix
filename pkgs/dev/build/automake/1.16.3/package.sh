{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/automake/automake-1.16.3.tar.xz
# md5 c27f608a4e1f302ec7ce42f1251c184e
{% endblock %}

{% block deps %}
# lib dev/build/autoconf/2.71 dev/lang/perl5 dev/lang/m4
# bld dev/build/make env/std
# run dev/build/libtool
{% endblock %}
