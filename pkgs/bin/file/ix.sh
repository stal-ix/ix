{% extends '//lib/magic/t/t/ix.sh' %}

{% block bld_libs %}
lib/z
lib/xz
lib/intl
lib/zstd
lib/bzip/2
{% if linux %}
lib/kernel
lib/seccomp
{% endif %}
{{super()}}
{% endblock %}

{% block std_box %}
# ensure same file
bin/file/host
{{super()}}
{% endblock %}

{% block make_flags %}
{{super()}}
FILE_COMPILE=file
FILE_COMPILE_DEP=
{% endblock %}

{% block configure_flags %}
--enable-elf
--enable-elf-core
--enable-zlib
--enable-bzlib
--enable-xzlib
--enable-zstdlib
{% if linux %}
--enable-libseccomp
{% endif %}
{% endblock %}
