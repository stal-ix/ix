{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/libidn/libidn2-2.3.1.tar.gz
# md5 cda07f5ac55fccfafdf7ee01828adad5
{% endblock %}

{% block deps %}
# lib lib/intl/mix.sh
# lib lib/iconv/mix.sh
# lib lib/unistring/mix.sh
# bld dev/build/automake/1.16.1/mix.sh
# bld dev/build/make/mix.sh
# bld dev/build/pkg-config/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Derror=idna2_error ${CPPFLAGS}"
{% if mix.platform.target.os == 'darwin' %}
{% endif %}
{% endblock %}

{% block prebuild %}
automake --add-missing
{% endblock %}

{% block env %}
export COFLAGS="--with-libidn2=${out} \${COFLAGS}"
{% endblock %}
