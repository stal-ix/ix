{% extends '//dev/lang/clang/t/mix.sh' %}

{% block install %}
{{super()}}

mkdir ${out}/share
mv ${out}/lib/clang/13*/include ${out}/share/
rm -rf ${out}/libexec

cd ${out}/bin

ln -s llvm-ranlib llvm-ar
{% endblock %}

{% block env %}
export CLANG_VERSION=13.0.0
export CPPFLAGS="-isystem ${out}/share/include \${CPPFLAGS}"
{% endblock %}
