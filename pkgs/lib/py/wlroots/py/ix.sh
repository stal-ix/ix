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
EOF
cp -R EGG-INFO pywlroots-0.16.6-py3.12.egg-info
py_exports > exports
cat exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
