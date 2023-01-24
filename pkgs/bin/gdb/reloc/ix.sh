{% extends '//bin/gdb/ix.sh' %}

{% block bld_data %}
{{super()}}
aux/terminfo
{% endblock %}

{% block bld_tool %}
bin/python/11
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/python/3/cross
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-python=$(which python3)
{% endblock %}

{% block install %}
{{super()}}
cp -R ${TERMINFO} ${out}/share/
cp -R ${TARGET_PYTHONHOME}/lib ${out}/
cd ${out}/bin
mkdir bin_gdb
mv gdb bin_gdb/
cat << EOF > gdb
#!/usr/bin/env sh
p1=\$(dirname \$(readlink -f "\${0}"))
p2=\$(dirname \${p1})
export TERMINFO=\${p2}/share/terminfo
export PYTHONHOME=\${p2}
export PYTHONPATH=\${p2}/share/gdb/python
exec \${p1}/bin_gdb/gdb "\${@}"
EOF
chmod +x gdb
{% endblock %}

{% block postinstall %}
find ${out} -type f -name '*.a' -delete
find ${out} -type f -name '*.o' -delete
rm -rf ${out}/include
rm -rf ${out}/lib/aux
rm -rf ${out}/lib/pkgconfig
{% endblock %}
