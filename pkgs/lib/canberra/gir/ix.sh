{% extends '//lib/canberra/ix.sh' %}

{% block host_libs %}
{{super()}}
lib/canberra/dl
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/gi/repository
{% endblock %}

{% block bld_data %}
lib/gi/files
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir
bin/vala
{% endblock %}

{% block env %}
export VALAFLAGS="--vapidir=${out}/share/vala/vapi \${VALAFLAGS}"
{% endblock %}
