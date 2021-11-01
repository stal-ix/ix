{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/libidn/libidn2-2.3.1.tar.gz
# md5 cda07f5ac55fccfafdf7ee01828adad5
{% endblock %}

{% block lib_deps %}
lib/intl/mix.sh
lib/iconv/mix.sh
lib/unistring/mix.sh
{% endblock %}

{% block bld_deps %}
dev/build/automake/1.16.1/mix.sh
dev/build/make/mix.sh
dev/build/pkg-config/mix.sh
env/std/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Derror=idna2_error ${CPPFLAGS}"
{% endblock %}

{% block prebuild %}
automake --add-missing
{% endblock %}

{% block env %}
export COFLAGS="--with-libidn2=${out} \${COFLAGS}"
{% endblock %}
