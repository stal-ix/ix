{% extends '//bin/xarchiver/stock/ix.sh' %}

{% block bld_libs %}
lib/shim/ix
{{super()}}
{% endblock %}

{% block cpp_missing %}
{{super()}}
ix.h
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|file_name = g_str.*|file_name = ix_uniq_socket();|' -i src/socket.c
sed -e 's|"/tmp"|ix_temp_dir()|' -i src/pref_dialog.c
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('xarchiver')}}
{% endblock %}
