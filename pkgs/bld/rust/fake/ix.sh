{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin
cat << EOF > rustc
{% include 'rustc.sh' %}
EOF
chmod +x *
{% endblock %}
