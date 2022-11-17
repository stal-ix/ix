{% extends 't/ix.sh' %}

{% block lib_deps %}
lib/c
lib/png
lib/tiff
lib/jpeg
lib/glib
{% endblock %}

{% block meson_flags %}
{{super()}}
builtin_loaders=all
{% endblock %}

{% block patch %}
(base64 -d | patch -p1) << EOF
{% include '0.diff/base64' %}
EOF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*bin.*||' -i ${out}/lib/pkgconfig/gdk-pixbuf-2.0.pc
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/gdk-pixbuf-2.0 \${CPPFLAGS}"
{% endblock %}
