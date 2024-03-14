{% extends '//lib/ffi/ix.sh' %}

{% block bld_tool %}
{{super()}}
bin/slibtool
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-multi-os-directory
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
wrap_cc
{% endblock %}

{% block configure %}
{{super()}}

cat << EOF > libtool
#!/usr/bin/env sh
exec slibtool-static "\${@}"
EOF

chmod +x libtool

cp libtool x86_64-w64-mingw32/
{% endblock %}
