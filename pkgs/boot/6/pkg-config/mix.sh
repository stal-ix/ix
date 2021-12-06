{% extends '//dev/build/pkg-config/mix.sh' %}

{% block bld_libs %}
boot/6/lib/iconv/mix.sh
{% endblock %}

{% block bld_deps %}
boot/5/env/std/mix.sh
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-internal-glib
{% endblock %}

{% block configure %}
{{super()}}
(cd glib && dash configure ${COFLAGS} --prefix=${out} --with-libiconv=gnu --srcdir=.)
{% endblock %}

{% block build %}
cd glib && make -j ${make_thrs}
{{super()}}
{% endblock %}
