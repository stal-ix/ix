{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wayland
{% endblock %}

{% block version %}
1.26.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland/-/archive/{{self.version().strip()}}/wayland-{{self.version().strip()}}.tar.bz2
ebf5fff1c8b11c24ceec74ff3047aefdb07efee8ce09bf3b856975aba3540d15
{% endblock %}

{% block meson_flags %}
documentation=false
tests=false
{% endblock %}

{% block c_rename_symbol %}
os_create_anonymous_file
{% endblock %}

{% block install %}
{{super()}}
# The ix libc closure already supplies pthread support. Keeping the compiler
# driver flag in public metadata makes -nostdlib consumers warn that it is
# unused, and every reverse dependency inherits the noise.
for pc in wayland-client wayland-server; do
    file=${out}/lib/pkgconfig/${pc}.pc

    if test -f ${file}; then
        sed -i 's| -pthread||g' ${file}
    fi
done
{% endblock %}
