{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/libproxy/libproxy/archive/refs/tags/0.5.6.tar.gz
sha:68cb4548143e843826a35e024dba8ced92117c0982c2cc9a4c8247e32d259603
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
