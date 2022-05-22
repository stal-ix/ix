{% extends '//lib/msh3/ix.sh' %}

{% block cmake_flags %}
{{super()}}
MSH3_TOOL=ON
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mkdir bin
mv lib/msh3app bin/
{% endblock %}
