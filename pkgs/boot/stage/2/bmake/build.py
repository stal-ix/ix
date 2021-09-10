{% extends '//util/run_sh_script.py' %}

{% block script %}
{% include 'build.sh' %}
{% endblock %}

{% block body %}
os.chdir(os.environ['out'])
os.makedirs('bin')
os.chdir('bin')
os.symlink('../bmake/bmake', 'bmake')

for x in ('uname', 'sed'):
    with open(x, 'w') as f:
        pass

    os.chmod(x, 0o755)
{% endblock %}
