{% extends '//lib/cffi/xkbcommon/t/ix.sh' %}

{% block bld_tool %}
bld/pip
bin/unzip
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mkdir lib
mv *.egg lib/
cd lib
unzip *.egg
rm xkbcommon/_ffi.py
rm *.egg
py_exports > exports
cat exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
