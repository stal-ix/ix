{% extends '//die/c_std.sh' %}

{% block fetch %}
http://penma.de/code/gettext-stub/gettext-stub-1.tar.gz
sha:04af6ee6720c9a90b51f9e420e1b2e75e3ddaba23a30263bf6e10739d8e8f994
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build %}
cc -c -o intl.o *.c
ar cq libintl.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.a ${out}/lib/
cp libintl-stub.h ${out}/include/libintl.h
{% endblock %}
