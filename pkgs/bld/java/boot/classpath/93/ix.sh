{% extends '//bld/java/boot/classpath/t/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/classpath/classpath-0.93.tar.gz
df2d093612abd23fe67e9409d89bb2a8e79b1664fe2b2da40e1c8ed693e32945
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/java/boot/jikes
{% endblock %}

{% block cpp_missing %}
{{super()}}
stdlib.h
{% endblock %}

{% block patch %}
{{super()}}
(base64 -d | patch -p1) << EOF
{% include 'classpath-miscompilation.patch/base64' %}
EOF
sed -e 's|/tmp/|'${TMPDIR}'|' \
    -i scripts/check_jni_methods.sh
{% endblock %}
