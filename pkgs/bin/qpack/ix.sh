{% extends '//lib/ng/http/3/t/ix.sh' %}

{% block install %}
{{super()}}
mkdir -p ${out}/bin
cp ${tmp}/obj/examples/qpack ${out}/bin/
{% endblock %}
