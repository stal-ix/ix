{% extends '//bin/greetd/t/ix.sh' %}

{% block cargo_features %}
nix/feature
{% endblock %}

{% block unpack %}
{{super()}}
cd agreety
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/agreety ${out}/bin/
{% endblock %}
