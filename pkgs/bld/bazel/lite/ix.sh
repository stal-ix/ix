{% extends '//die/gen.sh' %}

{# bazel_lite: Bazel cc targets built without Bazel. See die/c/bazel.sh. #}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > bazel_lite
{% include 'bazel_lite.py/base64' %}
EOF

chmod +x *
{% endblock %}
