{% extends '//mix/template/py.py' %}

{% block fetch %}
# url https://storage.yandexcloud.net/mix-cache/{{self.link().strip()}}
# md5 {{self.md5().strip()}}
{% endblock %}

{% block run_deps %}
env/lld/{{mix.platform.target.os}}/mix.sh
env/clang/mix.sh
{% endblock %}

{% block build %}
import os

out = os.environ['out']
src = os.environ['src']

os.chdir(out)

for x in os.listdir(src):
    if len(x) > 16:
        mix.untar(os.path.join(src, x))

envp = os.path.join(out, 'env')

try:
    with open(envp + '.template', 'r') as f:
        data = f.read()
except FileNotFoundError:
    data = r"""
export CLANG_VERSION=13.0.0
export CPPFLAGS="-isystem :prefix:/lib/clang/${CLANG_VERSION}/include ${CPPFLAGS}"
""".strip()

with open(envp, 'w') as f:
    f.write(data.replace(':prefix:', out))
{% endblock %}
