{% extends '//die/c/premain.sh' %}

{% block std_box %}
bld/dlfcn
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/c
{{super()}}
{% endblock %}

{% block premain_code_gen %}
(
{% block export_map %}
{% endblock %}
) | dl_stubs
{% endblock %}
