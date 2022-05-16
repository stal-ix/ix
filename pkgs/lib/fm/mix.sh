{% extends '//lib/fm/t/mix.sh' %}

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
