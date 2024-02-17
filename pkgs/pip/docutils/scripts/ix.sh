{% extends '//pip/docutils/ix.sh' %}

{% block run_deps %}
bld/python
{{super()}}
{% endblock %}

{% block install %}
{{super()}}

mkdir ${out}/bin

cd ${out}/lib/docutils-*data/scripts

for x in *.py; do
    cat - ${x} << EOF > _
#!$(which python3)
EOF
    chmod +x _
    mv _ ${out}/bin/${x}
done
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): do not prune lib/'
{% endblock %}
