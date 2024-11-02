{% extends '//bin/greetd/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd agreety
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/agreety ${out}/bin/
{% endblock %}
