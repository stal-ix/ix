{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
fc7a67ea86ace13195b0bce683fd4469
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/iconv
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block c_rename_symbol %}
{% if target.os == 'darwin' %}
glob
fnmatch
globfree
{% endif %}
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${PWD}/glob ${CPPFLAGS}"
{% endblock %}

{% block configure_flags %}
--disable-load
{% endblock %}
