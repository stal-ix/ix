{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz
# md5 6d906edfdb3202304059233f51f9a71d
{% endblock %}

{% block deps %}
# bld lib/intl lib/iconv env/c boot/final/env
{% endblock %}
