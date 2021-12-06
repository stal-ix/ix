{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz
0d90823e1426f1da2fd872df0311298d
{% endblock %}

{% block bld_libs %}
lib/intl/mix.sh
lib/sigsegv/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/help2man/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block configure_flags %}
--disable-c++
{% endblock %}

{% block test %}
${out}/bin/m4
{% endblock %}
