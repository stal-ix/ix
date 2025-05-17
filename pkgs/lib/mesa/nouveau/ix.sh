{% extends '//lib/mesa/valve/ix.sh' %}

{% block bld_tool %}
{{super()}}
bin/cbindgen
bin/rust/bindgen
bld/rust(rustc_ver=86)
{% endblock %}
