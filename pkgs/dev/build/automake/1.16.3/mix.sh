{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-1.16.3.tar.xz
c27f608a4e1f302ec7ce42f1251c184e
{% endblock %}

{% block lib_deps %}
dev/build/autoconf/2.71/mix.sh
dev/lang/perl5/mix.sh
{% endblock %}

{% block bld_deps %}
env/autohell/mix.sh
{% endblock %}

{% block run_deps %}
dev/build/libtool/mix.sh
dev/lang/m4/mix.sh
{% endblock %}
