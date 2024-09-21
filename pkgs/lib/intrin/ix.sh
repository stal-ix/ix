{% extends '//die/std/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/19/ver.sh' %}
{% endblock %}

{% block install %}
cp -R clang/lib/Headers ${out}/include
{% endblock %}

{% block env %}
export CPPFLAGS="-isystem${out}/include \${CPPFLAGS}"
{% endblock %}
