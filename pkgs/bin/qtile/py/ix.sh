{% extends '//bin/qtile/t/ix.sh' %}

{% block bld_tool %}
bld/pip
bin/unzip
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
unzip qtile*
rm qtile*
base64 -d << EOF > libqtile/pangocffi.py
{% include 'pangocffi.py/base64' %}
EOF
py_exports > exports
cat exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
