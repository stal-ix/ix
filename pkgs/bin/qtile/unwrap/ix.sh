{% extends '//die/python/bin.sh' %}

{% block bld_libs %}
pip/pyxdg
lib/python
lib/glib/dl
lib/pango/dl
pip/dbus-next
pip/palettable
lib/drivers/3d
lib/gdk/pixbuf/dl
bin/qtile/module/register
{% endblock %}

{% block build_flags %}
{% endblock %}

{% block entry_point %}qtile{% endblock %}

{% block step_unpack %}
cat << EOF > qtile
import sys
sys.dont_write_bytecode = True
import traceback
sys.excepthook = traceback.print_exception
import libqtile.scripts.main as lm
lm.main()
EOF
{% endblock %}
