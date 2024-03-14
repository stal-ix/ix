{% extends '//lib/ffi/t/ix.sh' %}

{% block bld_tool %}
bld/auto(conf_ver=2/71,std_box=bld/boot/box)
bld/fake(tool_name=makeinfo)
{{super()}}
{% endblock %}
