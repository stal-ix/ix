{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz
12cfa1687ffa2606337efe1a64416106
{% endblock %}

{% block run_deps %}
dev/lang/m4
{% endblock %}

{% block bld_tool %}
dev/lang/m4
dev/tool/perl
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}
