{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
fc7a67ea86ace13195b0bce683fd4469
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
