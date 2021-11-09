{% extends '//pypi/docutils/mix.sh' %}

{% block extra_run_deps %}
dev/lang/python/3/minimal/mix.sh
{% endblock %}

{% block postinstall %}
cd ${out}/lib/python/docutils-*data/scripts

for x in *.py; do
    cat - ${x} << EOF > _
#!$(command -v python3)
EOF
    mv _ ${x}
    chmod +x ${x}
done
{% endblock %}

{% block extra_env %}
export PATH="${out}/lib/python/docutils-0.18.data/scripts:\${PATH}"
{% endblock %}

{% block test %}
. ${out}/env

rst2html.py --help
{% endblock %}
