{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/fix
cd ${out}/fix

cat << EOF > c++
#!/usr/bin/env sh
set -e
. __realm__/env
exec __realm__/bin/clang++ \${CPPFLAGS} \${CFLAGS} \${CXXFLAGS} \${LDFLAGS} \${OPTFLAGS} "\${@}"
EOF

cat << EOF > cc
#!/usr/bin/env sh
set -e
. __realm__/env
exec __realm__/bin/clang \${CPPFLAGS} \${CFLAGS} \${LDFLAGS} \${OPTFLAGS} "\${@}"
EOF

cat << EOF > cpp
#!/usr/bin/env sh
set -e
. __realm__/env
exec __realm__/bin/clang-cpp \${CPPFLAGS} "\${@}"
EOF

cat << EOF > prepare-compiler.sh
mkdir -p bin
mv fix/c++ bin/
sed -e "s|__realm__|\${PWD}|g" -i bin/c++
mv fix/cc bin/
sed -e "s|__realm__|\${PWD}|g" -i bin/cc
mv fix/cpp bin/
sed -e "s|__realm__|\${PWD}|g" -i bin/cpp
EOF

chmod +x *
{% endblock %}
