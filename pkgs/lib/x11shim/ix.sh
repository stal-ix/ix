{% extends '//die/c_std.sh' %}

{% block unpack %}
: nothing to unpack
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build %}
cc -c -o empty.o -x c - << EOF
EOF

ar q libempty.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include

cp libempty.a ${out}/lib/libX11.a
cp libempty.a ${out}/lib/libxcb.a

mkdir ${out}/include/X11

cat << EOF > ${out}/include/X11/Xlib.h
typedef void Display;
#define XOpenDisplay(X) NULL
#define DefaultScreen(X) 0
#define DisplayWidth(X, Y) 0
#define DisplayHeight(X, Y) 0
EOF
{% endblock %}
