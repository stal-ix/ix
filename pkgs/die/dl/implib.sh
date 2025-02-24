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

{% block build %}
cat << EOF > {{self.implib_name().strip()}}.c
{% for x in ix.parse_list(self.implib_symbols()) %}
void {{x}}() {
}
{% endfor %}
EOF
${FREESTANDING_CLANG} --target={{target.gnu.three}} -fuse-ld=lld -shared -nodefaultlibs -nostartfiles \
    -o {{self.implib_name().strip()}}.so \
    {{self.implib_name().strip()}}.c
implib-gen.py --target {{target.gnu_arch}}-linux-gnu {{self.implib_name().strip()}}.so
find .
cc -c -o tramp.o {{self.implib_name().strip()}}.so.tramp.S
cc -c -o init.o {{self.implib_name().strip()}}.so.init.c
ar q libimplib.a tramp.o init.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libimplib.a ${out}/lib/lib{{self.implib_name().strip()}}.a
{% endblock %}
