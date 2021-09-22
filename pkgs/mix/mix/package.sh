{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/mix/archive/df5ae085c34b8e3ab08e49acc61c7cd92b0a38d4.zip
# md5 f88abec6f9edf7395b758c2fa6565eb4
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
