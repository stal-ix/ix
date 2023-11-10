{% extends '//bin/qtile/t/ix.sh' %}

{% block bld_tool %}
bld/pip
bin/unzip
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp -R build/lib*/libqtile ${out}/lib/
cd ${out}/lib
base64 -d << EOF > libqtile/pangocffi.py
{% include 'pangocffi.py/base64' %}
EOF
sed -e 's|XCursorManager(24)|XCursorManager(int(os.environ.get("XCURSOR_SIZE", "24")))|' -i libqtile/backend/wayland/core.py
py_exports > exports
cat exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
