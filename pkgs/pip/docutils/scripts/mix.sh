{% extends '//pip/docutils/mix.sh' %}

{% block run_deps %}
bld/python
{{super()}}
{% endblock %}

{% block install %}
{{super()}}

mkdir ${out}/bin

cd ${out}/share && cd docutils-*data/scripts

for x in *.py; do
    cat - ${x} << EOF > _
#!$(which python3)
EOF
    chmod +x _
    mv _ ${out}/bin/${x}
done
{% endblock %}

{% block test_bin %}
. ${out}/env

export PATH="${out}/bin:${PATH}"

rst2html.py --help
{% endblock %}
