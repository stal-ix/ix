{% extends '//bin/mutter/t/ix.sh' %}

{% block install %}
mkdir ${out}/lib
cp $(find ${tmp} -name libdefault.a) ${out}/lib/
{% endblock %}
