{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/phase1geo/Minder/archive/refs/tags/1.16.4.tar.gz
sha:3a9c2831d36a7744f7df27412b2f75b2bec38f5974984a027d6fa7f634a37c7e
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/gee
lib/xml/2
lib/cairo
lib/handy
lib/granite
lib/archive
lib/discount
lib/gtk/deps
lib/json/glib
lib/gtk/source/view
lib/gtk/source/view/4/ctor
{% endblock %}

{% block bld_tool %}
bld/gir
bld/glib
bin/vala
bld/gettext
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/glib/gir
lib/handy/gir
lib/granite/{{gtk_ver}}/gir
lib/gtk/source/view/{{1 + gtk_ver | int}}/gir
lib/gi/repository/gir
{% endblock %}

{% block patch %}
sed -e 's|testing = .*|testing = app;|' \
    -e 's|testing.run()|testing.run(args)|' \
    -i src/Application.vala
cat << EOF > meson/post_install.py
#!/usr/bin/env python3
EOF
chmod +x meson/post_install.py
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/com* ${out}/bin/minder
{% endblock %}
