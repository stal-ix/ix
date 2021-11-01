{% extends '//dev/build/pkg-config/mix.sh' %}

{% block bld_deps %}
boot/lib/iconv/mix.sh
boot/stage/5/env/mix.sh
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

{% block check_tools %}
{% endblock %}
