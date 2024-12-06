{% extends '//die/gen.sh' %}

{% block bld_deps %}
bld/boot/2/env
{% endblock %}

{% block install %}
echo "{{ix_boot_path}}"
mkdir ${out}/bin
{% if ix_boot_tool('clang++') %}
{% for x in ['clang', 'clang++', 'clang-cpp', 'llvm-ar', 'llvm-nm', 'llvm-ranlib'] %}
{% if not ix_boot_tool(x) %}
{{error(x + ' not in path')}}
{% endif %}
ln -s {{ix_boot_tool(x)}} ${out}/bin/{{x}}
{% endfor %}
{% elif ix_boot_tool('g++') %}
{% for x in ['gcc', 'g++', 'ar', 'nm', 'ranlib', 'as', 'ld', 'cpp'] %}
{% if not ix_boot_tool(x) %}
{{error(x + ' not in path')}}
{% endif %}
ln -s {{ix_boot_tool(x)}} ${out}/bin/{{x}}
{% endfor %}
{% else %}
error('shit happen')
{% endif %}
ls -la ${out}/bin/
{% endblock%}


{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "/bin/sh", "-s"]
{% endblock %}
