{% extends '//lib/py/wlroots/t/ix.sh' %}

{% block bld_tool %}
bld/pip
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
cat << EOF > wlroots/xwayland.py
class Surface:
    pass
def XWayland(*args, **kwargs):
    raise RuntimeError('shit happen')
EOF
sed -e 's|return lib.wlr_surface_is_xwayland_surface.*|return False|' -i wlroots/wlr_types/compositor.py
py_exports > exports
cat exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}:\${PYTHONPATH}"
{% endblock %}
