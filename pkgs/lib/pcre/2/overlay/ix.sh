{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/pcre/2
{% endblock %}

{% block install %}
mkdir ${out}/include
cat << EOF >> ${out}/include/regex.h
#pragma once
#undef regcomp
#undef regexec
#undef regfree
#undef regerror
#include <pcre2posix.h>
EOF
{% endblock %}

{% block env %}
export CPPFLAGS="-Dregcomp=pcre2_regcomp -Dregexec=pcre2_regexec \${CPPFLAGS}"
{% endblock %}
