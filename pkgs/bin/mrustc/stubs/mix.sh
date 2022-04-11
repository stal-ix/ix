{% extends '//mix/c_std.sh' %}

{% block unpack %}
: nothing to unpack
{% endblock %}

{% block build %}
cc -c -o empty.o -x c - << EOF
EOF

ar cq libempty.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libempty.a ${out}/lib/libatomic.a
cp libempty.a ${out}/lib/libgcc_s.a
{% endblock %}
