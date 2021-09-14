{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/libcxxrt/libcxxrt/archive/refs/heads/master.zip
# md5 3b43179e518dd0a54362267b255b9d24
{% endblock %}

{% block deps %}
# lib boot/lib/cxx/unwind
# bld boot/stage/5/env
{% endblock %}

{% block build %}
for s in src/*.cc; do
    g++ -c $s
done

for s in src/*.c; do
    gcc -c $s
done

ar q libcxxrt.a *.o
ranlib libcxxrt.a
{% endblock %}

{% block install %}
mkdir ${out}/lib
mkdir ${out}/include

cp libcxxrt.a ${out}/lib/
cp src/*.h ${out}/include/
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="${out}/lib/libcxxrt.a \${LDFLAGS}"
{% endblock %}

{% block notest %}
. ${out}/env

clang++ ${CPPFLAGS} ${CFLAGS} ${CXXFLAGS} ${LDFLAGS} -o test -x c++ - << EOF
int main() {
    try {
        throw 1;
    } catch (...) {
        return 0;
    }

    return 1;
}
EOF

./main
{% endblock %}
