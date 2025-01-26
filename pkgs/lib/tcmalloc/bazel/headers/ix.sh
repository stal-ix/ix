{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/include
cat << EOF > ${out}/include/stdlib.h
{% include 'stdlib.h' %}
EOF
{% endblock %}

{% block env %}
export CFLAGS="-Wno-gnu-include-next \${CFLAGS}"
{% endblock %}
