{% extends '//bld/java/boot/jamvm/2/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/java/boot/jamvm/good
bld/java/boot/ecj/5/javac
{% endblock %}

{% block bins %}
appletviewer
jarsigner
keytool
jar
native2ascii
serialver
javah
rmiregistry
tnameserv
orbd
rmid
rmic
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/share/classpath/examples
cp ${out}/share/classpath/tools.zip ${out}/lib/tools.jar
cp $(which javac) ${out}/bin/
{% for x in self.bins() | parse_list %}
cat << EOF > ${out}/bin/{{x}}
#!/usr/bin/env sh
exec g{{x}} "\${@}"
EOF
{% endfor %}
chmod +x ${out}/bin/*
ln -s jamvm ${out}/bin/java
ln -s . ${out}/jre
rm -rf ${out}/include
rm -rf ${out}/lib/libjvm*
{% endblock %}
