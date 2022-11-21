{% extends 't/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libkmod.so libkmod.a
{% endblock %}
