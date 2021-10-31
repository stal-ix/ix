{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://archive.apache.org/dist/subversion/subversion-1.14.1.tar.bz2
# md5 2eccc2c7451397e01a13682600af9563
{% endblock %}

{% block deps %}
# bld lib/z/mix.sh
# bld lib/lz4/mix.sh
# bld lib/apr/mix.sh
# bld lib/intl/mix.sh
# bld lib/serf/mix.sh
# bld lib/expat/mix.sh
# bld lib/sqlite3/mix.sh
# bld lib/apr-util/mix.sh
# bld lib/utf8proc/mix.sh
# bld dev/build/make/mix.sh
# bld dev/build/pkg-config/mix.sh
# bld env/std/mix.sh
# run shell/openssh/mix.sh
{% endblock %}

{% block cflags %}
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v expat | tr '\n' ' ')
export COFLAGS="${COFLAGS} --with-expat=$lib_expat/include:$lib_expat/lib:-lexpat"
{% endblock %}
