{% extends '//mix/c_std.sh' %}

{% block unpack %}
: nothing to unpack
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build %}
cat << EOF > qsort_r.h
{% include 'qsort_r.h' %}
EOF

cat << EOF > error.h
{% include 'error.h' %}
EOF

cat << EOF > sched.h
{% include 'sched.h' %}
EOF

cc -c -o qsort_r.o -x c - << EOF
{% include 'qsort_r.c' %}
EOF

cc -c -o error.o -x c - << EOF
{% include 'error.c' %}
EOF

cc -c -o sched.o -x c - << EOF
{% include 'sched.c' %}
EOF

ar cq libglibcshim.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.a ${out}/lib/
cp *.h ${out}/include/
{% endblock %}
