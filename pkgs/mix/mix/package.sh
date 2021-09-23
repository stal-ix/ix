{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/mix/archive/daaf6bb01932b7d51d37968637286130066c3b3b.zip
# md5 5335f11a1c13e01d3d3cd8afaf89df41
{% endblock %}

{% block deps %}
# lib dev/lang/python3 pypi/pygments pypi/jinja2 shell/dash/minimal
# bld env/std
{% endblock %}

{% block build %}
mkdir ${out}/mix && mv * ${out}/mix/ && cd ${out}
mkdir bin && cd bin

cat << EOF > mix
#!$(which dash)
export PYTHONPATH="${PYTHONPATH}"
export PYTHONDONTWRITEBYTECODE=1

exec $(which python3) "${out}/mix/mix" "\$@"
EOF

chmod +x mix
{% endblock %}

{% block test %}
python3 -c 'import jinja2; import pygments;'
{% endblock %}
