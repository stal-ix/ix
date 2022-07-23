{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > packexe
#!/usr/bin/env sh
llvm-strip \${1}
upx \${1}
EOF

chmod +x packexe
{% endblock %}
