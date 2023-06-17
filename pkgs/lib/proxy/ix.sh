{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/libproxy/libproxy/archive/refs/tags/0.5.2.tar.gz
sha:7d75a2cf1c977056eb86f460daab0247d30e6a34e26ec755aab4de40cfd0a06d
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
