{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/fix
cd ${out}/fix

cat << EOF > c++
#!/usr/bin/env sh
set -e
. __realm__/env
exec clang++ -nostdlib -nostdlib++ -nostdinc -nostdinc++ \${CPPFLAGS} \${CFLAGS} \${CXXFLAGS} \${LDFLAGS} \${OPTFLAGS} -fuse-ld=lld "\${@}"
EOF

cat << EOF > cc
#!/usr/bin/env sh
set -e
. __realm__/env
exec clang -nostdlib -nostdlib++ -nostdinc -nostdinc++ \${CPPFLAGS} \${CFLAGS} \${LDFLAGS} \${OPTFLAGS} -fuse-ld=lld "\${@}"
EOF

cat << EOF > prepare-compiler.sh
mkdir -p bin
mv fix/c++ bin/
sed -e "s|__realm__|\${PWD}|" -i bin/c++
mv fix/cc bin/
sed -e "s|__realm__|\${PWD}|" -i bin/cc
EOF

chmod +x *
{% endblock %}
