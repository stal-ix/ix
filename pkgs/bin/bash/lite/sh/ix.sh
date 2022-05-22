{% extends '//bin/bash/lite/ix.sh' %}

{% block bld_tool %}
bld/bison
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
mv bash sh
{% endblock  %}
