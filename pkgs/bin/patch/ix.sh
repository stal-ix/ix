{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz
78ad9937e4caadcba1526ef1853730d5
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block std_box %}
bld/bison
{{super()}}
{% endblock %}
