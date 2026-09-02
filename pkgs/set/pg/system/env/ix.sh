{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/etc/profile.d

cat << EOF > ${out}/etc/profile.d/ix_package_cache.sh
export IX_PACKAGE_CACHE=10.0.0.32:8054,10.0.0.33:8054,10.0.0.64:8054,10.0.0.65:8054,10.0.0.66:8054,10.0.0.67:8054,10.0.0.68:8054,10.0.0.69:8054,10.0.0.70:8054,10.0.0.71:8054,10.0.0.72:8054,10.0.0.73:8054,10.0.0.74:8054,10.0.0.75:8054
EOF
{% endblock %}
