{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz
12cfa1687ffa2606337efe1a64416106
{% endblock %}

{% block bld_tool %}
bin/m4
bld/perl
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}
