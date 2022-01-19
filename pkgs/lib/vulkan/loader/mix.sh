{% extends '//lib/vulkan/loader/t/mix.sh' %}

{% block run_data %}
lib/vulkan/loader/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts
{% endblock %}

{% block configure %}
{{super()}}
python3 $(which fix_data_dir.py) ${VULKAN_LOADER_DATA}
{% endblock %}

{% block install %}
{{super()}}
mkdir -p ${out}/include
{% endblock %}
