{% extends '//dev/build/pkg-config/mix.sh' %}

{% block bld_deps %}
boot/6/lib/iconv/mix.sh
boot/5/env/std/mix.sh
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
