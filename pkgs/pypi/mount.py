PYPI = {
    'beautysh/package.sh': {
        'url': 'https://files.pythonhosted.org/packages/36/c8/23a1c06e462cb107f29d741ffd8851bf5469738d1aeb8d977d271db69b89/beautysh-6.1.0-py3-none-any.whl',
        'md5': '0edfde5715fcb643db59724c61365d0f',
        'run': ['pypi/setuptools'],
    },
    'boto3/package.sh': {
        'url': 'https://files.pythonhosted.org/packages/e3/7c/580de0ee483182140e5e022737837b9ab7f9b0704682b0ce04d00cc10736/boto3-1.18.53-py3-none-any.whl',
        'md5': 'bdb7e3b4a283624e7ee773c888ddeeb6',
        'run': ['pypi/botocore', 'pypi/s3transfer', 'pypi/jmespath'],
    },
    'botocore/package.sh': {
        'url': 'https://files.pythonhosted.org/packages/79/94/b035eaf361b426421563f63fcf4df9fe14091913705c1eb16f6ce2d4aa90/botocore-1.21.53-py3-none-any.whl',
        'md5': '4059bde467f02b4fd6b10405a2bc1073',
        'run': ['pypi/six', 'pypi/python-dateutil', 'pypi/urllib3'],
    },
    'python-dateutil/package.sh': {
        'url': 'https://files.pythonhosted.org/packages/36/7a/87837f39d0296e723bb9b62bbb257d0355c7f6128853c78955f57342a56d/python_dateutil-2.8.2-py2.py3-none-any.whl',
        'md5': '95743ca628ad14d4aeb3628907f017bd',
    },
    'jinja2/package.sh': {
        'md5': 'b377af8123a32e992984222bff51e152',
        'url': 'https://files.pythonhosted.org/packages/80/21/ae597efc7ed8caaa43fb35062288baaf99a7d43ff0cf66452ddf47604ee6/Jinja2-3.0.1-py3-none-any.whl',
        'run': ['pypi/markupsafe'],
    },
    'jmespath/package.sh': {
        'md5': 'a066efd76c72debc36775316e34a70bc',
        'url': 'https://files.pythonhosted.org/packages/07/cb/5f001272b6faeb23c1c9e0acc04d48eaaf5c862c17709d20e3469c6e0139/jmespath-0.10.0-py2.py3-none-any.whl',
    },
    'pygments/package.sh': {
        'md5': '23ad6b4ae954b138728c09d8668f225e',
        'url': 'https://files.pythonhosted.org/packages/78/c8/8d9be2f72d8f465461f22b5f199c04f7ada933add4dae6e2468133c17471/Pygments-2.10.0-py3-none-any.whl',
    },
    's3transfer/package.sh': {
        'md5': 'd662ab6d1f330cc3c6db025093c28bf8',
        'url': 'https://files.pythonhosted.org/packages/ab/84/fc3717a7b7f0f6bb08af593127171f08e3e0087c197922da09c01bfe7c3a/s3transfer-0.5.0-py3-none-any.whl',
        'run': ['pypi/botocore'],
    },
    'setuptools/package.sh': {
        'md5': 'f1dbc68b4f2eee6db47a77764db5cc2f',
        'url': 'https://files.pythonhosted.org/packages/41/f4/a7ca4859317232b1efb64a826b8d2d7299bb77fb60bdb08e2bd1d61cf80d/setuptools-58.2.0-py3-none-any.whl',
    },
    'six/package.sh': {
        'md5': '529d7fd7e14612ccde86417b4402d6f3',
        'url': 'https://files.pythonhosted.org/packages/d9/5a/e7c31adbe875f2abbb91bd84cf2dc52d792b5a01506781dbcf25c91daf11/six-1.16.0-py2.py3-none-any.whl',
    },
    'urllib3/package.sh': {
        'md5': '9c0e97a18e35e3acaa8698e68e12bca1',
        'url': 'https://files.pythonhosted.org/packages/af/f4/524415c0744552cce7d8bf3669af78e8a069514405ea4fcbd0cc44733744/urllib3-1.26.7-py2.py3-none-any.whl',
    },
}


TMPL = '''
{% extends '//util/wheel.sh' %}

{% block url %}
{url}
{% endblock %}

{% block md5 %}
{md5}
{% endblock %}

{% block wheel_deps %}
# run {run}
{% endblock %}
'''


def gen_pkg(rec):
    return TMPL.replace('{url}', rec['url']).replace('{md5}', rec['md5']).replace('{run}', ' '.join(rec.get('run', [])))


def serve(x):
    try:
        return gen_pkg(PYPI[x])
    except KeyError:
        raise FileNotFoundError(x)
