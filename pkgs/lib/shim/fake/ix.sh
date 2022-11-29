{% extends '//die/c/ix.sh' %}

{% block unpack %}
: nothing to unpack
{% endblock %}

{% block build %}
cc -c -o empty.o -x c -
ar q libempty.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libempty.a ${out}/lib/lib{{lib_name}}.a
{% endblock %}
