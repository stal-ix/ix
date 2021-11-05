{% extends 'template.sh' %}

{% set make_flags %}
SHELL="$(command -v dash)"
PREFIX="${out}"
prefix="${out}"

{% block make_flags %}
{% endblock %}

{% block make_target %}
{% endblock %}
{% endset %}

{% set real_flags %}{{mix.fix_list(make_flags)}}{% endset %}

{% block build %}
make -j ${make_thrs} {{real_flags}} || make {{real_flags}}
{% endblock %}

{% block install %}
make {{real_flags}} {% block install_target %}install{% endblock %}
{% endblock %}
