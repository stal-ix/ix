{% extends '//bin/dbus/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}; mv bin old; mkdir bin
mv old/dbus-daemon bin/
rm -r old
{% endblock %}
