{% extends '//lib/fm/t/ix.sh' %}

{% block lib_deps %}
lib/fm/menu/cache
{% endblock %}

{% block bld_libs %}
lib/fm/extra
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-gtk=3
--disable-actions
--disable-old-actions
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/glib/codegen
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block configure %}
{{super()}}
# https://lists.gnu.org/archive/html/bug-libtool/2016-06/msg00001.html
sed -e 's|func__fatal_error|func_fatal_error|' -i libtool
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|-shared -export-dynamic||' -i src/modules/Makefile.am
{% endblock %}
