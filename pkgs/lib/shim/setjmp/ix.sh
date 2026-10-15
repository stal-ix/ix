{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/include
cat << EOF > ${out}/include/setjmp.h
{% include 'setjmp.h' %}
EOF
{% endblock %}
