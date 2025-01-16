{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > clang
#!/usr/bin/env sh
YA_C_FLAGS="{{ya_c_flags}}"
EOF

base64 -d << EOF >> clang
{% include 'clang.sh/base64' %}
EOF

cp clang clang++

chmod +x *
{% endblock %}
