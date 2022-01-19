{% extends '//bin/clang/t/mix.sh' %}

{% block install %}
{{super()}}

mkdir ${out}/share
mv ${out}/lib/clang/13*/include ${out}/share/
rm -rf ${out}/libexec
{% endblock %}

{% block env %}
export CLANG_VERSION=13.0.0
export CPPFLAGS="-isystem ${out}/share/include \${CPPFLAGS}"
{% endblock %}

{% block postinstall %}
rm -rf ${out}/lib ${out}/include
{% endblock %}
