{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
fc7a67ea86ace13195b0bce683fd4469
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
lib/intl/mix.sh
lib/iconv/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
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
