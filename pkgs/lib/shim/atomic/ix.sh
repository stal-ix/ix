{% extends '//die/c/ix.sh' %}

{% block unpack %}
: nothing to unpack
{% endblock %}

{% block build %}
cc -c -o empty.o -x c - << EOF
EOF

ar q libempty.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libempty.a ${out}/lib/libatomic.a
cp libempty.a ${out}/lib/libstdc++fs.a
cp libempty.a ${out}/lib/libgcc_s.a
{% endblock %}
