{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz
# md5 6d906edfdb3202304059233f51f9a71d
{% endblock %}

{% block bld_deps %}
lib/intl/mix.sh
lib/iconv/mix.sh
env/std/0/mix.sh
{% endblock %}
