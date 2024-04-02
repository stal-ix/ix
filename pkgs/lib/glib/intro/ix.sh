{% extends '//lib/glib/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/gir
bld/glib
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/gi/repository
{% endblock %}

{% block host_libs %}
lib/glib/dl(libglib_ver=pure)
lib/build/muldefs
{% endblock %}

{% block meson_flags %}
{{super()}}
introspection=enabled
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*override.*||' -i girepository/compiler/meson.build
{% endblock %}

{% block cpp_includes %}
{{super()}}
${PWD}
{% endblock %}
