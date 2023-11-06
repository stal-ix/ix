{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/lib/pip
cat << EOF > ${out}/lib/pip/__init__.py
EOF
cat << EOF > ${out}/lib/pip/__main__.py
EOF
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
