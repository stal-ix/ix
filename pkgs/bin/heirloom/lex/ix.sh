{% extends '//bin/heirloom/t/ix.sh' %}

{% block postinstall %}
cd ${out}
mkdir lib
mv bin/lib/libl.a lib/
{% endblock %}

{% block install %}
rm ${out}/bin/yacc
{% endblock %}
