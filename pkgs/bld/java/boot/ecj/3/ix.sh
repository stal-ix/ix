{% extends '//die/c/ix.sh' %}

{% block fetch %}
http://archive.eclipse.org/eclipse/downloads/drops/R-3.2.2-200702121330/ecjsrc.zip
070cd425f5324349073c8ea9a3a0d43166429264584da9e9537888d6a7401216
{% endblock %}

{% block bld_tool %}
bin/fastjar
bld/java/boot/ant/8
bld/java/boot/jikes
bld/java/boot/jamvm/1
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block build %}
cat << EOF > manifest
Manifest-Version: 1.0
Main-Class: org.eclipse.jdt.internal.compiler.batch.Main
EOF
set -x
find . -type f -name '*.java' | while read l; do
    jikes -nowarn ${l}
done
fastjar cvfm ecj-bootstrap.jar manifest .
{% endblock %}

{% block install %}
mkdir ${out}/share
cp ecj-bootstrap.jar ${out}/share/
{% endblock %}

{% block env %}
export ECJ_JAR="${out}/share/ecj-bootstrap.jar"
{% endblock %}
