{# libstr.a: the string and memory functions of github.com/pg83/str, one
   object, built by the project's own compiler (Python, no C compiler) #}

{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
str
{% endblock %}

{% block version %}
4
{% endblock %}

{% block fetch %}
https://github.com/pg83/str/archive/refs/tags/{{self.version().strip()}}.tar.gz
e39aee132383a5056da9776f77b193d36d1f69ec604622d75f991724b5f5ffcd
{% endblock %}

{# under a std_box/std_env flag (the boot tools) the box is the flag's, its python 3.10 builds this #}
{% block std_box %}
{{super()}}
bld/python
{% endblock %}

{# in place of musl's string functions (lib/musl/naked): under a sanitizer the intercepted ones become __real_*, as musl's would #}
{% block bld_libs %}
lib/build/sanitize
{% endblock %}

{% block build_flags %}
san_intercept
{% endblock %}

{# the released archive as it is, then its public functions under their libc names:
   only the symbol table changes, the code is the one proved #}
{% block build %}
python3 dev/strcc.py . -o libstr.a --out post
for f in memcpy memmove memset memcmp memchr strlen strnlen strcpy strcat strcmp strspn strcspn \
         bcmp bcopy bzero explicit_bzero mempcpy strncat strlcpy strlcat strpbrk strsep strtok strtok_r \
         memmem strstr
do
    echo "str_${f} ${f}"
done > libc.syms
llvm-objcopy --redefine-syms=libc.syms libstr.a
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libstr.a ${out}/lib/
{% endblock %}
