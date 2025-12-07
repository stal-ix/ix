{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/javac
{% include 'javac.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}

{% block env %}
export GCJ_JAVAC_TRUE=no
export JAVAC=${out}/bin/javac
export ac_cv_prog_java_works=yes
{% endblock %}
