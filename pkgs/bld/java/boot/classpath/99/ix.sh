{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/classpath/classpath-0.99.tar.gz
f929297f8ae9b613a1a167e231566861893260651d913ad9b6c11933895fecc8
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/fastjar
bld/java/boot/ecj/3/javac
{% endblock %}

{% block configure_flags %}
--with-ecj-jar=${ECJ_JAR}
--disable-Werror
--disable-gmp
--disable-gtk-peer
--disable-gconf-peer
--disable-plugin
--disable-dssi
--disable-alsa
--disable-gjdoc
{% endblock %}

{% block patch %}
sed -e 's|/tmp/|'${TMPDIR}'|' \
    -i scripts/check_jni_methods.sh.in
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
