{% extends '//dev/lang/bison/template.sh' %}

{% block deps %}
# bld boot/stage/7/lib/package.sh
# lib boot/stage/8/m4/package.sh
# bld boot/stage/4/make/package.sh
# bld boot/stage/8/flex/package.sh
# bld boot/stage/6/env/clang/package.py
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
