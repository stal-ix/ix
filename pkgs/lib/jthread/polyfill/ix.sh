{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/jthread
{% endblock %}

{% block install %}
mkdir ${out}/include
cat << EOF > ${out}/include/thread
#pragma once
#include_next <thread>
#include <jthread.hpp>
#include <stop_token.hpp>
EOF
{% endblock %}
