{% extends '//bin/assemble/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old bin/bin_ix
{% endblock %}
