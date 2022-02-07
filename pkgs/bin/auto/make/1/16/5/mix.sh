{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-1.16.5.tar.xz
sha:f01d58cd6d9d77fbdca9eb4bbd5ead1988228fdb73d6f7a201f5f8d6b118b469
{% endblock %}

{% block bld_tool %}
bin/m4
bld/perl
bin/auto/conf/2/71
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}
