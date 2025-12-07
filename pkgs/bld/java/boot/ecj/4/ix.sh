{% extends '//die/c/ix.sh' %}

{% block bld_tool %}
bld/python
bin/fastjar
bld/java/boot/ant/8
bld/java/boot/ecj/3
bld/java/boot/jamvm/2
bld/java/boot/ecj/3/javac/scripts
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block fetch %}
http://archive.eclipse.org/eclipse/downloads/drops4/R-4.2.1-201209141800/ecjsrc-4.2.1.jar
d261b2158f598640f1923805d2e9bf47eb21d8333f4e1b37f59f847ad00d48f4
{% endblock %}

{% block patch %}
find . -type f -name '*.java' | while read l; do
    sed -e 's|@Override||' -i ${l}
done
rm org/eclipse/jdt/core/JDTCompilerAdapter.java
rm -rf org/eclipse/jdt/internal/antadapter
mkdir -p META-INF
cat << EOF > manifest
Manifest-Version: 1.0
Main-Class: org.eclipse.jdt.internal.compiler.batch.Main
EOF
set -x
find . -type f -name '*.java' | xargs javac -nowarn
fastjar cvfm ecj-bootstrap.jar manifest .
{% endblock %}

{% block install %}
mkdir ${out}/share
cp ecj-bootstrap.jar ${out}/share/
{% endblock %}

{% block env %}
export IX_ECJ_JAR="${out}/share/ecj-bootstrap.jar"
{% endblock %}
