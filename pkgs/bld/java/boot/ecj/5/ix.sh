{% extends '//die/c/ix.sh' %}

{% block bld_tool %}
bld/python
bin/fastjar
bld/java/boot/ant/9
bld/java/boot/ecj/4/javac
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block fetch %}
http://archive.eclipse.org/eclipse/downloads/drops4/R-4.3.2-201402211700/ecjsrc-4.3.2.jar
5515a358486559c3b4b53840654378a19db89d232a7bdb978c20ffa9e1ed77ac
{% endblock %}

{% block patch %}
rm org/eclipse/jdt/core/JDTCompilerAdapter.java
rm -rf org/eclipse/jdt/internal/antadapter
{% endblock %}

{% block build %}
set -x
find . -type f -name '*.java' | xargs javac -target 6 -source 6 -classpath . -nowarn
mkdir -p META-INF
cat << EOF > manifest
Manifest-Version: 1.0
Main-Class: org.eclipse.jdt.internal.compiler.batch.Main
EOF
fastjar cvfm ecj-bootstrap.jar manifest .
{% endblock %}

{% block install %}
mkdir ${out}/share
cp ecj-bootstrap.jar ${out}/share/
{% endblock %}

{% block env %}
export IX_ECJ_JAR="${out}/share/ecj-bootstrap.jar"
{% endblock %}
