{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
papers
{% endblock %}

{% blcok version %}
48.0
{% endblock %}

{% block git_repo %}
https://gitlab.gnome.org/GNOME/Incubator/papers
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
71fbc5600d8be3a34aa7b60a41fd89fb9bb159e15ee2e28479b662858df5f472
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/t1
lib/intl
lib/dbus
lib/glib
lib/xml/2
lib/gtk/4
lib/secret
lib/exempi
lib/adwaita
lib/spectre
lib/archive
lib/poppler
lib/djvulibre
lib/gsettings/desktop/schemas
{% endblock %}

{% block meson_tool %}
bld/meson/6
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gnome
bld/gettext
bld/rust(rustc_ver=83)
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block meson_flags %}
previewer=false
thumbnailer=false
nautilus=false
tests=false
documentation=false
user_doc=false
{% endblock %}

{% block cpp_flags %}
-isystem${CLANG_HEADERS}
{% endblock %}
