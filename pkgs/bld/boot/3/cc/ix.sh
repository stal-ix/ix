{% extends '//die/gen.sh' %}

{% block bld_deps %}
bld/boot/2/env
{% endblock %}

{% block install %}
mkdir ${out}/bin
{% for x in ['clang', 'clang++', 'clang-cpp', 'llvm-ar', 'llvm-nm', 'llvm-ranlib', 'gcc', 'g++', 'ar', 'nm', 'ranlib', 'as', 'ld', 'cpp'] %}
{% if ix_boot_tool(x) %}
ln -s {{ix_boot_tool(x)}} ${out}/bin/{{x}}
{% endif %}
{% endfor %}
{% endblock%}

{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "/bin/sh", "-s"]
{% endblock %}
