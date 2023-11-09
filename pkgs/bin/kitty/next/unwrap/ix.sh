{% extends '//die/python/bin.sh' %}

{% block bld_libs %}
lib/python
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
kc.is_wayland = lambda x: True
import kitty.main as km
km.main()
EOF
{% endblock %}
