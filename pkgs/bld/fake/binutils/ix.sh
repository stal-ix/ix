{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > {{bin_prefix}}readelf
#!/usr/bin/env sh
exec llvm-readelf "\${@}"
EOF

cat << EOF > {{bin_prefix}}objdump
#!/usr/bin/env sh
exec llvm-objdump "\${@}"
EOF

cat << EOF > {{bin_prefix}}objcopy
#!/usr/bin/env sh
exec llvm-objcopy "\${@}"
EOF

cat << EOF > {{bin_prefix}}ar
#!/usr/bin/env sh
exec llvm-ar "\${@}"
EOF

cat << EOF > {{bin_prefix}}as
#!/usr/bin/env sh
exec llvm-as "\${@}"
EOF

chmod +x *
{% endblock %}
