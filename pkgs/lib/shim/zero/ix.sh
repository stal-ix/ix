{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/include
cat << EOF > ${out}/include/ix_zero.h
#pragma once

template <class T>
inline void Zero(T& t) {
    t = T{};
}
EOF
{% endblock %}

{% block env %}
export CXXFLAGS="-include${out}/include/ix_zero.h \${CXXFLAGS}"
{% endblock %}
