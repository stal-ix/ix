{% extends '//lib/dlfcn/t/ix.sh' %}

{% block step_unpack %}
base64 -d << EOF > dlfcn.h
{% include 'dlfcn.h/base64' %}
EOF
base64 -d << EOF > dlfcn.cpp
{% include 'dlfcn.cpp/base64' %}
EOF
base64 -d << EOF > Makefile
{% include 'Makefile/base64' %}
EOF
{% endblock %}
