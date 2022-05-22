{% extends '//bin/pkg/config/ix.sh' %}

{% block bld_libs %}
bld/boot/6/lib/iconv
{% if darwin %}
lib/darwin/framework/CoreServices
{% endif %}
{% endblock %}

{% block bld_deps %}
bld/boot/5/env/std
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-internal-glib
{% endblock %}

{% block configure %}
{{super()}}
(cd glib && sh configure ${COFLAGS} --prefix=${out} --with-libiconv=gnu --srcdir=.)
{% endblock %}

{% block build %}
cd glib && make -j ${make_thrs}
{{super()}}
{% endblock %}
