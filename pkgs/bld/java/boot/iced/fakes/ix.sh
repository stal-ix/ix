{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/include
cat << EOF > ${out}/include/fakes.h
{% include 'fakes.h' %}
EOF
{% endblock %}
