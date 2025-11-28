{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/classpath/classpath-0.93.tar.gz
df2d093612abd23fe67e9409d89bb2a8e79b1664fe2b2da40e1c8ed693e32945
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/jikes
bin/fastjar
{% endblock %}

{% block configure_flags %}
--disable-Werror
--disable-gmp
--disable-gtk-peer
--disable-gconf-peer
--disable-plugin
--disable-dssi
--disable-alsa
--disable-gjdoc
{% endblock %}

{% block cpp_missing %}
stdlib.h
{% endblock %}

{% block patch %}
sed -e 's|/tmp/|'${TMPDIR}'|' \
    -i scripts/check_jni_methods.sh
{% endblock %}

{% block postinstall %}
mv ${out}/lib/classpath/*.a ${out}/lib/
rm -rf ${out}/lib/classpath
{% endblock %}

{% block env %}
export GNU_CLASSPATH=${out}
{% endblock %}

{% block c_rename_symbol %}
fabsf
{% endblock %}
