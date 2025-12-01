{% extends '//bld/java/boot/jamvm/2/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/java/boot/oracle/1
bld/java/boot/jamvm/good
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
cp $(which javac) ${out}/bin/
{% for x in ix.parse_list(self.bins()) %}
cat << EOF > ${out}/bin/{{x}}
#!/usr/bin/env sh
exec g{{x}} "\${@}"
EOF
{% endfor %}
chmod +x ${out}/bin/*
ln -s jamvm ${out}/bin/java
{% endblock %}
