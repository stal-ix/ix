{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz
aeb29c6a90350a4c959cd1df38cd0a7e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
{% if kind == 'bin' %}
lib/intl
{% endif %}
lib/readline
{% endblock %}

{% if kind == 'lib' %}
{% block std_box %}
box/boot
{% endblock %}
{% endif %}

{% block bld_tool %}
dev/lang/bison/3/boot
{% endblock %}

{% block configure_flags %}
--enable-libgdbm-compat
--with-readline
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib && ln -s libgdbm_compat.a libdbm.a
{% endblock %}

{% block env %}
export COFLAGS="--with-gdbm=${out} \${COFLAGS}"
{% endblock %}
