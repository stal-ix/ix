{% extends '//dev/build/pkg-config/package.sh' %}

{% block deps %}
# bld boot/lib/iconv/package.sh
# bld boot/stage/5/env/package.sh
{% endblock %}

{% block pkgflags %}
--with-internal-glib
{% endblock %}

{% block postconf %}
(cd glib && dash ./configure ${COFLAGS} --prefix=${out} --with-libiconv=gnu --srcdir=.)
{% endblock %}

{% block prebuild %}
cd glib && make -j ${make_thrs}
{% endblock %}
