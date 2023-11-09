{% extends '//die/python/bin.sh' %}

{% block bld_libs %}
lib/python
lib/mesa/egl/dl
lib/fontconfig/dl
bin/kitty/next/py
bin/kitty/next/modules
{% endblock %}

{% block extra_modules %}
zipfile
{% endblock %}

{% block build_flags %}
{% endblock %}

{% block entry_point %}kitty{% endblock %}

{% block step_unpack %}
cat << EOF > kitty
import sys
sys.dont_write_bytecode = True
sys.kitty_run_data = {
    'bundle_exe_dir': "${out}/bin"
}
import kitty.constants as kc
kc.default_pager_for_help = ('gnuless', '-iRXF')
def is_wayland(*args, **kwargs):
    return True
kc.is_wayland = is_wayland
import kitty.embed as ke
def read_kitty_resource(name, **kwargs):
    return ke.find('./kitty/' + name)
kc.read_kitty_resource = read_kitty_resource
import kitty.main as km
km.main()
EOF
{% endblock %}
