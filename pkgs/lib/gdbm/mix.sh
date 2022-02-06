{% extends '//lib/gdbm/t/mix.sh' %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block configure_flags %}
--enable-libgdbm-compat
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib && ln -s libgdbm_compat.a libdbm.a
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-gdbm=${out} \${COFLAGS}"
{% endblock %}
