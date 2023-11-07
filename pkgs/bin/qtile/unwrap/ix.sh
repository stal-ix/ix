{% extends '//die/python/bin.sh' %}

{% block bld_libs %}
lib/python
lib/glib/dl
lib/pango/dl
pip/dbus-next
lib/drivers/3d
lib/gdk/pixbuf/dl
bin/qtile/module/register
{% endblock %}

{% block extra_modules %}
zipfile
{% endblock %}

{% block build_flags %}
{% endblock %}

{% block entry_point %}qtile{% endblock %}

{% block step_unpack %}
cat << EOF > qtile
import sys
sys.dont_write_bytecode = True
import wlroots
import wlroots._ffi
def eat(*args, **kwargs):
    return False
wlroots._ffi.__dict__['wlr_surface_is_xwayland_surface'] = eat
import libqtile.scripts.main as lm
lm.main()
EOF
{% endblock %}
