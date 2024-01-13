{% extends '//lib/xz/t/ix.sh' %}

{% block bld_libs %}
lib/intl
{{super()}}
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/shebangs
{% endblock %}

{% block build_flags %}
{{super()}}
fix_shebangs
{% endblock %}
