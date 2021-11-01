{% extends '//dev/lang/bison/template.sh' %}

{% block lib_deps %}
boot/stage/8/m4/mix.sh
{% endblock %}

{% block bld_deps %}
boot/stage/7/lib/mix.sh
boot/stage/8/flex/mix.sh
boot/stage/6/env/clang/mix.sh
{% block bison %}
{% endblock %}
{% endblock %}

{% block toolconf %}
cat << EOF > perl
EOF

chmod +x perl

cat << EOF > makeinfo
EOF

chmod +x makeinfo

cat << EOF > help2man
#!$(command -v dash)

touch doc/bison.1.tmp
EOF

chmod +x help2man
{% endblock %}

{% block build %}
make
{% endblock %}
