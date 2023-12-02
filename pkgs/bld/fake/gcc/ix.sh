{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > {{bin_prefix}}gcc
#!/usr/bin/env sh
exec clang "\${@}"
EOF

cat << EOF > {{bin_prefix}}g++
#!/usr/bin/env sh
exec clang++ "\${@}"
EOF

chmod +x *
{% endblock %}
