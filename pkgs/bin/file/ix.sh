{% extends '//lib/magic/t/t/ix.sh' %}

{% block bld_libs %}
lib/intl
{{super()}}
{% endblock %}

{% block std_box %}
# ensure same file
bin/file/host
{{super()}}
{% endblock %}

{% block make_flags %}
{{super()}}
FILE_COMPILE=file
FILE_COMPILE_DEP=
{% endblock %}
