{% extends '//bin/greetd/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd agreety
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/agreety ${out}/bin/
{% endblock %}
