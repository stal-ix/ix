{% extends '//lib/py/wlroots/t/ix.sh' %}

{% block bld_tool %}
bld/pip
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv pywl* lib
cd lib
rm wlroots/_ffi.py
cat << EOF > wlroots/xwayland.py
class Surface:
    pass
def XWayland(*args, **kwargs):
    raise RuntimeError('shit happen')
EOF
sed -e 's|return lib.wlr_surface_is_xwayland_surface.*|return False|' -i wlroots/wlr_types/compositor.py
cp -R EGG-INFO pywlroots-0.16.6-py3.12.egg-info
py_exports > exports
cat exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
