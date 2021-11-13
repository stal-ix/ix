{% extends '//pypi/docutils/mix.sh' %}

{% block run_deps %}
dev/build/python/mix.sh
{{super()}}
{% endblock %}

{% block install %}
{{super()}}

mkdir ${out}/bin

cd ${out}/lib/python && cd docutils-*data/scripts

for x in *.py; do
    cat - ${x} << EOF > _
#!$(command -v python3)
EOF
    chmod +x _
    mv _ ${out}/bin/${x}
done
{% endblock %}

{% block test %}
. ${out}/env

export PATH="${out}/bin:${PATH}"

rst2html.py --help
{% endblock %}
