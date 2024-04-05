{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/libproxy/libproxy/archive/refs/tags/0.5.5.tar.gz
sha:11a2eace773755e79b8d37833985ce475aed4ca4d3e6656defd5eef67b5a00f1
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block meson_flags %}
vapi=false
docs=false
curl=false
tests=false
config-gnome=false
introspection=false
pacrunner-duktape=false
{% endblock %}

{% block patch %}
cat << EOF > data/install-git-hook.sh
#!/usr/bin/env sh
EOF
chmod +x data/install-git-hook.sh
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/lib/libproxy/*.a ${out}/lib/
rm -r ${out}/lib/libproxy
{% endblock %}
