{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/include
cat << EOF > ${out}/include/stdlib.h
{% include 'stdlib.h' %}
EOF
{% endblock %}
