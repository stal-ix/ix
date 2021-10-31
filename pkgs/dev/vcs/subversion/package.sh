{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://archive.apache.org/dist/subversion/subversion-1.14.1.tar.bz2
# md5 2eccc2c7451397e01a13682600af9563
{% endblock %}

{% block deps %}
# bld lib/z/package.sh
# bld lib/lz4/package.sh
# bld lib/apr/package.sh
# bld lib/intl/package.sh
# bld lib/serf/package.sh
# bld lib/expat/package.sh
# bld lib/sqlite3/package.sh
# bld lib/apr-util/package.sh
# bld lib/utf8proc/package.sh
# bld dev/build/make/package.sh
# bld dev/build/pkg-config/package.sh
# bld env/std/package.sh
# run shell/openssh/package.sh
{% endblock %}

{% block cflags %}
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v expat | tr '\n' ' ')
export COFLAGS="${COFLAGS} --with-expat=$lib_expat/include:$lib_expat/lib:-lexpat"
{% endblock %}
