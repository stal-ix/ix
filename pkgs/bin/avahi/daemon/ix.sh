{% extends '//bin/avahi/t/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/avahi-daemon bin/
rm -rf share etc old
{% endblock %}
