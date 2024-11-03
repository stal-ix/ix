{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > rust_devendor
{% include 'devendor.sh/base64' %}
EOF

base64 -d << EOF > rust_classify
{% include 'classify.py/base64' %}
EOF

base64 -d << EOF > cargo_strip_profile
{% include 'strip.py/base64' %}
EOF

chmod +x *
{% endblock %}
