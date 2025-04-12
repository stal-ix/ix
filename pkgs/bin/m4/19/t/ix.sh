{% extends '//die/c/autohell.sh' %}

{% block version %}
1.4.19
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/m4/m4-{{self.version().strip()}}.tar.xz
sha:63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}

{% block std_box %}
{{super()}}
bld/help2man
{% endblock %}

{% block configure_flags %}
--disable-c++
{% endblock %}
