{% extends '//bld/java/boot/classpath/t/t/ix.sh' %}

{% block git_repo %}
https://git.savannah.gnu.org/git/classpath.git
{% endblock %}

{% block git_commit %}
5a1dcb13eaa6040be54cf3bc6772470a397b2c79
{% endblock %}

{% block git_sha %}
01ab84253c2410e6fb7d20aac90e521671779a492be035dc09a36659d3061b8c
{% endblock %}

{% block bld_tool %}
bld/perl
bld/gettext
bld/texinfo
{{super()}}
bld/java/boot/ecj/3/javac
bld/java/boot/classpath/99
{% endblock %}

{% block configure_flags %}
--with-ecj-jar=${ECJ_JAR}
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|/tmp/|'${TMPDIR}'|' \
    -i scripts/check_jni_methods.sh.in
sed -e 's|DIE=1|DIE=0|' -i autogen.sh
find . -type f -name '*.java' | while read l; do
    sed -e 's|@Override||' -i ${l}
done
{% endblock %}
