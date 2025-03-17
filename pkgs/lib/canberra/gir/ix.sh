{% extends '//lib/canberra/ix.sh' %}

{% block host_libs %}
{{super()}}
lib/canberra/dl
{% endblock %}

{% block bld_data %}
lib/glib/gir
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir
bin/vala
{% endblock %}

{% block env %}
export VALAFLAGS="--vapidir=${out}/share/vala/vapi \${VALAFLAGS}"
{% endblock %}
