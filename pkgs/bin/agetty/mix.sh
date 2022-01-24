{% extends '//bin/util/linux/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv bin old; mkdir bin
mv old/agetty bin/agetty
rm -rf old share
{% endblock %}
