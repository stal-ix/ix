{% extends '//dev/lang/bison/template.sh' %}

{% block deps %}
# bld boot/stage/7/lib
# lib boot/stage/8/m4
# bld boot/stage/4/make boot/stage/8/flex boot/stage/6/env/clang
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
#!$(which dash)

touch doc/bison.1.tmp
EOF

chmod +x help2man
{% endblock %}

{% block postconf %}
rm tests/bison
ln -s $(which bison) tests/
{% endblock %}

{% block build %}
make
{% endblock %}
