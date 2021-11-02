{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://archive.apache.org/dist/subversion/subversion-1.14.1.tar.bz2
# md5 2eccc2c7451397e01a13682600af9563
{% endblock %}

{% block bld_deps %}
lib/z/mix.sh
lib/lz4/mix.sh
lib/apr/mix.sh
lib/intl/mix.sh
lib/serf/mix.sh
lib/expat/mix.sh
lib/sqlite3/mix.sh
lib/apr-util/mix.sh
lib/utf8proc/mix.sh
env/autohell/mix.sh
{% endblock %}

{% block run_deps %}
shell/openssh/mix.sh
{% endblock %}

{% block cflags %}
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v expat | tr '\n' ' ')
export COFLAGS="${COFLAGS} --with-expat=$lib_expat/include:$lib_expat/lib:-lexpat"
{% endblock %}
