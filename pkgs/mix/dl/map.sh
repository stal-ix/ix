{% extends '//mix/premain.sh' %}

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
{% block export_map %}
{% endblock %}
) | dl_stubs
{% endblock %}
