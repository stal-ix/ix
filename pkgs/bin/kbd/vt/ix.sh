{% extends '//bin/kbd/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/chvt old/deallocvt old/openvt bin/
rm -rf etc share old
{% endblock %}
