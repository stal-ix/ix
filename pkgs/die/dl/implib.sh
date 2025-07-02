{% extends '//die/c/ix.sh' %}

{% block step_unpack %}
: nothing
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block impllib_name %}
{% endblock %}

{% block implib_symbols %}
{% endblock %}

{% block bld_tool %}
bld/python
bld/implib
bld/fake/binutils
{% endblock %}

{% block implib_target %}
{% if linux %}
{{target.gnu_arch}}-linux-gnu
{% elif freebsd %}
{{target.gnu_arch}}-linux-gnu
{% else %}
{{error('unsupported target for implib')}}
{% endif %}
{% endblock %}

{% block build %}
cat << EOF > {{self.implib_name().strip()}}.def
LIBRARY lib{{self.implib_name().strip()}}.so
EXPORTS
{% for x in ix.parse_list(self.implib_symbols()) %}
  {{x}}
{% endfor %}
EOF
cat {{self.implib_name().strip()}}.def
implib-gen.py --target {{self.implib_target().strip()}} {{self.implib_name().strip()}}.def
cc -c -o tramp.o {{self.implib_name().strip()}}.tramp.S
cc -c -o init.o {{self.implib_name().strip()}}.init.c
ar q libimplib.a tramp.o init.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libimplib.a ${out}/lib/lib{{self.implib_name().strip()}}.a
{% endblock %}
