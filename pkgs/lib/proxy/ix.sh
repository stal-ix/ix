{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/libproxy/libproxy/archive/refs/tags/libproxy-0.5.0.tar.gz
sha:a57ae66d16c9dceb4a2869ee69a541005b7c896651e66da91aa646dacfbbd25c
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
