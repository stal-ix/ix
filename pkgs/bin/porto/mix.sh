{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/yandex/porto/archive/refs/tags/v4.20.8.tar.gz
sha:0fa0887ade6a98c3d4f591c9d6c35816d251b054b60e8955ab31636611fca10b
{% endblock %}

{% block setup_tools %}
cat << EOF > pandoc
#!/bin/sh
EOF

chmod +x pandoc
{% endblock %}

{% block lib_deps %}
lib/c
lib/nl
lib/c++
lib/curses
lib/protobuf
{% endblock %}

{% block bld_tool %}
lib/protobuf
{% endblock %}

{% block setup %}
exit 123
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}
