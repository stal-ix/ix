{% extends '//bin/gdb/reloc/ix.sh' %}

{% block bld_tool %}
bld/tar
{{super()}}
{% endblock %}

{% block postinstall %}
{{super()}}
cd ${out}
find . -type d | while read l; do
    chmod +w ${l}
done
ln -s ../share/terminfo lib/terminfo
mkdir gdb
mv bin lib share gdb/
bsdtar cfz gdb.tgz gdb
rm -rf gdb
{% endblock %}
