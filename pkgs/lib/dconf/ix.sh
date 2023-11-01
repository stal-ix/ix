{% extends 't/ix.sh' %}

{% block install %}
{{super()}}
mv ${out}/lib/gio/modules/libdconfsettings.a ${out}/lib/
{% endblock %}
