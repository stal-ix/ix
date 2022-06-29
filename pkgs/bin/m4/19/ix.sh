{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz
sha:63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96
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
${out}/bin/m4 --help
{% endblock %}
