{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/include
cat << EOF > ${out}/include/mutex
{% include 'mutex' %}
EOF
{% endblock %}
