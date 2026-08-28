{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libproxy
{% endblock %}

{% block version %}
0.5.12
{% endblock %}

{% block fetch %}
https://github.com/libproxy/libproxy/archive/refs/tags/{{self.version().strip()}}.tar.gz
a1fa55991998b80a567450a9e84382421a7176a84446c95caaa8b72cf09fa86f
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
sed -e 's|libproxy = shared_library(|libproxy = library(|' \
    -e '/^libproxy_static = static_library(/,/^)/d' \
    -i src/libproxy/meson.build
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
