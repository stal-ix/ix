{% extends '//lib/c++/13/ix.sh' %}

{% block setup_target_flags %}
{{super()}}
export CXXFLAGS="-std=c++14 ${CXXFLAGS}"
{% endblock %}

{% block patch %}
{{super()}}
patch -p1 << EOF
{% include '//lib/c++/13/gcc-13.patch' %}
EOF
{% endblock %}
