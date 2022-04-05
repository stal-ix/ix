{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz
0d90823e1426f1da2fd872df0311298d
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}

{% block bld_tool %}
bld/help2man
{% endblock %}

{% block configure_flags %}
--disable-c++
{% endblock %}

{% block test %}
${out}/bin/m4
{% endblock %}
