{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/include
cat << EOF > ${out}/include/pwd.h
{% include 'pwd.h' %}
EOF
cat << EOF > ${out}/include/grp.h
{% include 'grp.h' %}
EOF
{% endblock %}
