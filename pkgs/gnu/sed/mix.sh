{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz
6d906edfdb3202304059233f51f9a71d
{% endblock %}

{% block bld_libs %}
lib/intl/mix.sh
lib/iconv/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}
