{% extends '//bin/clang/16/ix.sh' %}

{% block llvm_targets %}
lld
{% endblock %}

{% block clang_fix_includes %}
{% endblock %}

{% block env %}
{% endblock %}

{% block patch %}
{{super()}}

cd lld

{#
patch -p1 << EOF
{% include 'patches/ctors-in-init-array.patch' %}
EOF
#}

patch -p1 << EOF
{% include 'patches/revert-25da87-fix-cuda10.patch' %}
EOF

patch -p1 << EOF
{% include 'patches/prefer-static.patch' %}
EOF
{% endblock %}
