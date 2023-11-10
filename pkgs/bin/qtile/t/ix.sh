{% extends '//die/c/ix.sh' %}

{% block git_repo %}
https://github.com/pg83/qtile
{% endblock %}

{% block git_commit %}
a30503a4b914fd7b2c51663501575d48797c6fa0
{% endblock %}

{% block git_sha %}
49aefa1f6b48ee7660f6860326ddac4f2dc9fad554e18bcc6e4dcf3ac8ed0e91
{% endblock %}

{% block bld_libs %}
lib/drm
pip/wheel
pip/setuptools
bin/qtile/deps
pip/setuptools_scm
{% endblock %}

{% block bld_tool %}
bld/python/frozen(py_extra_modules=lib/cffi/module/register:lib/py/wayland/module/register:lib/py/wlroots/module/register:lib/cairo/dl:lib/cffi/xkbcommon/module/register,python_ver={{python_ver}})
{% endblock %}

{% block build %}
${NATIVE_PYTHON} setup.py build
{% endblock %}

{% block install %}
${NATIVE_PYTHON} setup.py install \
    --no-use-wheel \
    --prefix=${out} \
    --install-lib=${out}/lib
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block c_rename_symbol %}
wrapped_log_callback
py_callback
wrapped_log_init
{% endblock %}

{% block patch %}
cat << EOF > PKG-INFO
{% include 'PKG-INFO' %}
EOF
sed -e 's|\[xcb\]||' \
    -e 's|.*xcffib.*1.*||' \
    -i setup.cfg
{% endblock %}
