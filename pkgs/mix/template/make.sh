{% extends 'template.sh' %}

{% set make_flags %}
SHELL="$(command -v dash)"
PREFIX="${out}"
prefix="${out}"
{% block make_flags %}
{% endblock %}
{% endset %}

{% block build %}
make {{mix.fix_list(make_flags)}} -j ${make_thrs} || make {{mix.fix_list(make_flags)}}
{% endblock %}

{% block install %}
make {{mix.fix_list(make_flags)}} install
{% endblock %}
