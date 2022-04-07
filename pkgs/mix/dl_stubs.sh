{% extends 'premain.sh' %}

{% block std_box %}
bld/scripts/dlfcn
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block premain_lang %}
c++
{% endblock %}

{% block premain_code_gen %}
(
set -eu
{% block export_map %}
{% endblock %}
) | dl_stubs_3
{% endblock %}
