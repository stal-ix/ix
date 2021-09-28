{% extends '//util/wheel.sh' %}

{% block url %}
https://files.pythonhosted.org/packages/4f/b1/4bb315e3b1799130386c0efca944c72d2efe5a1e33dc6792fcb010235a99/boto3-1.18.50-py3-none-any.whl
{% endblock %}

{% block md5 %}
433e347b91e9fcfaeb86a764cd81a9d8
{% endblock %}

{% block wheel_deps %}
# run pypi/botocore pypi/s3transfer pypi/jmespath
{% endblock %}
