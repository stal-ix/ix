{% extends '//die/std/ix.sh' %}

{% block postinstall %}
echo 'nothing to fix'
{% endblock %}

{% block chmod_ro %}
{% endblock %}

{% block fix_mtime %}
{% endblock %}

{% block env %}
export OSX_SDK="${out}"
export CPPFLAGS="--sysroot \${OSX_SDK} -isystem\${OSX_SDK}/usr/include -F\${OSX_SDK} \${CPPFLAGS}"
export LDFLAGS="--sysroot \${OSX_SDK} -L\${OSX_SDK}/usr/lib -F\${OSX_SDK} -Wl,-platform_version -Wl,macos -Wl,\${MACOSX_DEPLOYMENT_TARGET} -Wl,\${MACOSX_DEPLOYMENT_TARGET} -lc \${LDFLAGS}"
{% endblock %}
