{% extends '//bin/assemble/ix.sh' %}

{% block build_flags %}
{{super()}}
compress
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old bin/bin_ix
{% endblock %}
