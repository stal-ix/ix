{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libproxy
{% endblock %}

{% block version %}
0.5.10
{% endblock %}

{% block fetch %}
https://github.com/libproxy/libproxy/archive/refs/tags/{{self.version().strip()}}.tar.gz
84734a0b89c95f4834fd55c26b362be2fb846445383e37f5209691694ad2b5de
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
