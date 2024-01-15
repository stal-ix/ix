{% extends '//bin/bsdutils/unwrap/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/env bin/
rm -rf old share
{% endblock %}
