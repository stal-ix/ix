{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/include
cat << EOF > ${out}/include/time.h
{% include 'time.h' %}
EOF
{% endblock %}
