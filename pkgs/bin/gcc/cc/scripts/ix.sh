{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > cc
#!/usr/bin/env sh
exec gcc \${@} -nostdlib \${CONLYFLAGS} \${CFLAGS} \${CPPFLAGS} -Wl,--start-group \${LDFLAGS}
EOF

cat << EOF > c++
#!/usr/bin/env sh
exec g++ \${@} -nostdlib \${CXXFLAGS} \${CFLAGS} \${CPPFLAGS} -Wl,--start-group \${LDFLAGS}
EOF

chmod +x cc c++
{% endblock %}

{% block env %}
export CC=cc
export CXX=c++
export HOSTCC=cc
export HOSTCXX=c++
{% endblock %}
