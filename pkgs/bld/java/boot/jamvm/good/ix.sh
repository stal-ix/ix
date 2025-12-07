{% extends '//bld/java/boot/jamvm/2/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/java/boot/ecj/4/javac
{% endblock %}

{% block install %}
{{super()}}
cat << EOF > ${out}/bin/java
#!/usr/bin/env sh
exec \${IX_JAVACMD} "\${@}"
EOF
chmod +x ${out}/bin/*
{% endblock %}
