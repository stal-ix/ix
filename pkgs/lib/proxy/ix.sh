{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/libproxy/libproxy/archive/refs/tags/0.5.7.tar.gz
sha:ca64b28a014cffde43f4052ec78b25a8a0f1aa4d78da721c605d64b1591e78dd
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
