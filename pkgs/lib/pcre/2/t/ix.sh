{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/PhilipHazel/pcre2/archive/refs/tags/pcre2-10.43.tar.gz
sha:f0048e26b02bdfaf43b8cec75030a9c2fe28552bf5caa693d3ccbf4d886fa930
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
PCRE2_BUILD_PCRE2_8=ON
PCRE2_BUILD_PCRE2_16=ON
PCRE2_BUILD_PCRE2_32=ON
PCRE2_NEWLINE=ANYCRLF
{% if wasi %}
PCRE2_SUPPORT_JIT=OFF
{% else %}
PCRE2_SUPPORT_JIT=ON
{% endif %}
PCRE2_BUILD_TESTS=OFF
PCRE2_SUPPORT_UNICODE=ON
{% endblock %}

{% block install %}
{{super()}}
for x in ${out}/lib/pkgconfig/*.pc; do
    sed -e 's|//.*/lib|/lib|' -i ${x}
done
cd ${out}
mkdir lib/cmake
mv cmake lib/cmake/pcre2
{% endblock %}
