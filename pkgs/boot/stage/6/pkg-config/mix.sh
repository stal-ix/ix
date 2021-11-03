{% extends '//dev/build/pkg-config/mix.sh' %}

{% block bld_deps %}
boot/stage/6/lib/iconv/mix.sh
boot/stage/6/diffutils/mix.sh
boot/stage/6/findutils/mix.sh
boot/stage/5/env/std/mix.sh
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
