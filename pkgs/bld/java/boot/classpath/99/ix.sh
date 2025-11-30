{% extends '//bld/java/boot/classpath/t/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/classpath/classpath-0.99.tar.gz
f929297f8ae9b613a1a167e231566861893260651d913ad9b6c11933895fecc8
{% endblock %}

{% block bld_tool %}
bld/perl
{{super()}}
bld/java/boot/ecj/3/javac
{% endblock %}

{% block configure_flags %}
--with-ecj-jar=${IX_ECJ_JAR}
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|/tmp/|'${TMPDIR}'|' \
    -i scripts/check_jni_methods.sh.in
{% endblock %}
