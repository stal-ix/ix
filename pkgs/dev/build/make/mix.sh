{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
# md5 fc7a67ea86ace13195b0bce683fd4469
{% endblock %}

{% block bld_deps %}
lib/intl/mix.sh
lib/iconv/mix.sh
env/c/mix.sh
boot/final/env/tools/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-I./glob ${CPPFLAGS}"

{% if mix.platform.target.os == 'darwin' %}
export CPPFLAGS="-Dglob=make_glob -Dglobfree=make_globfree -Dfnmatch=make_fnmatch ${CPPFLAGS}"
{% endif %}
{% endblock %}

{% block coflags %}
--disable-load
{% endblock %}
