{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-1.16.3.tar.xz
c27f608a4e1f302ec7ce42f1251c184e
{% endblock %}

{% block bld_tool %}
bld/perl
bin/auto/conf/2/71
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}

{% block run_deps %}
bld/perl
bin/auto/libtool
bin/m4
{% endblock %}

{% block autoreconf %}
{% endblock %}
