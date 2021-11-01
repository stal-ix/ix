{% extends 'template.sh' %}

{% set make_flags %}
SHELL="$(command -v dash)"
PREFIX="${out}"
prefix="${out}"
{% block make_flags %}
{% endblock %}
{% endset %}

{% set make_target %}
{% block make_target %}
all
{% endblock %}
{% endset %}

{% block build %}
make {{mix.fix_list(make_flags)}} -j ${make_thrs} {{make_target.strip()}} || make {{mix.fix_list(make_flags)}} {{make_target.strip()}}
{% endblock %}

{% block install %}
make {{mix.fix_list(make_flags)}} install
{% endblock %}
