{% extends '//lib/intl/gnu/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/fake/er(tool_name=gettext)
bld/fake/er(tool_name=xgettext)
bld/fake/er(tool_name=msgfmt)
bld/fake/er(tool_name=msgmerge)
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-nls
{% endblock %}

{% block touch_yl %}
{% endblock %}
