{% extends '//mix/c_std.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block lib_deps %}
lib/musl/orig
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block build %}
cat << EOF > error.h
#pragma once

extern unsigned int musl_error_message_count;
#define error_message_count musl_error_message_count

void musl_error(int status, int errnum, const char* format, ...);
#define error(status, errnum, ...) musl_error(status, errnum, __VA_ARGS__)
EOF

cc -c -o error.o -x c - << EOF
{% include 'error.c' %}
EOF

ar q libmuslcompat.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.h ${out}/include
cp *.a ${out}/lib
{% endblock %}
