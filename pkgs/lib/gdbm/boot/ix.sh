{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz
sha:37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
bld/flex
bld/bison
{{super()}}
{% endblock %}

{% block configure_flags %}
--enable-libgdbm-compat
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
ln -s libgdbm_compat.a libdbm.a
{% endblock %}

{% block env %}
export COFLAGS="--with-gdbm=${out} \${COFLAGS}"
{% endblock %}
