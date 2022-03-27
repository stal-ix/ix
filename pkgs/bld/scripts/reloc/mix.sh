{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/reloc.py
{% include 'reloc.py/base64' %}
EOF
{% endblock %}

{% block env %}
relocate() (
    python3 ${out}/bin/reloc.py "\${@}"
)
{% endblock %}
