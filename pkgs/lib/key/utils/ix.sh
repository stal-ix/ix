{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/key/utils/boot
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block make_no_thrs %}
{% endblock %}
