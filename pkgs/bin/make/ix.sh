{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
sha:e05fdde47c5f7ca45cb697e973894ff4f5d79e13b750ed57d7b66d8defc78e19
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
