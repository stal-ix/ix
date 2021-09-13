{% extends '//util/autohell.sh' %}

{% block deps %}
# bld lib/intl lib/iconv env/c boot/final/env
{% endblock %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
# md5 fc7a67ea86ace13195b0bce683fd4469
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
