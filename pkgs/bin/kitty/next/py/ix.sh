{% extends '//bin/kitty/next/t/ix.sh' %}

{% block bld_tool %}
bld/pip
bld/python/embed
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp -R kitty ${out}/lib/
cd ${out}/lib
find . -name '*.glsl' | gen_embed > kitty/embed.py
py_exports > exports
cat exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:${PYTHONPATH}"
{% endblock %}
