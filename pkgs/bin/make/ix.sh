{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/make/make-4.4.tar.gz
sha:581f4d4e872da74b3941c874215898a7d35802f03732bdccee1d4a7979105d18
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block c_rename_symbol %}
{% if darwin %}
glob
fnmatch
globfree
{% endif %}
{% endblock %}

{% block cpp_includes %}
${PWD}/glob
{% endblock %}

{% block configure_flags %}
--disable-load
{% endblock %}
