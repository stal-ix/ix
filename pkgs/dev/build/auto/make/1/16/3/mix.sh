{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-1.16.3.tar.xz
c27f608a4e1f302ec7ce42f1251c184e
{% endblock %}

{% block bld_tool %}
dev/tool/perl/mix.sh
dev/build/auto/conf/2/71/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block run_deps %}
dev/tool/perl/mix.sh
dev/build/auto/libtool/mix.sh
dev/lang/m4/mix.sh
{% endblock %}

{% block autoreconf %}
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
{% endblock %}
