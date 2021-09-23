{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/mix/archive/fa427e3f5b016b5e6ba9c993bda57866a2de00e8.zip
# md5 1341092215c9bae259fda50479a92610
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
