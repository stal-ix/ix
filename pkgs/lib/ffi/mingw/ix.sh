{% extends '//lib/ffi/ix.sh' %}

{% block bld_tool %}
{{super()}}
bin/slibtool
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-multi-os-directory
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
wrap_cc
{% endblock %}

{% block configure %}
{{super()}}
find . -name Makefile | while read l; do
    sed -e 's|LIBTOOL = .*|LIBTOOL = slibtool-static|' -i ${l}
done
{% endblock %}
