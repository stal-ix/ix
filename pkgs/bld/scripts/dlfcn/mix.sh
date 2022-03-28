{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block ind_deps %}
bld/scripts/dlfcn/lib
{% endblock %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/gen_dl_stubs_1.py
{% include 'gen_dl_stubs_1.py/base64' %}
EOF

base64 -d << EOF > ${out}/bin/gen_dl_stubs_2.py
{% include 'gen_dl_stubs_2.py/base64' %}
EOF
{% endblock %}
