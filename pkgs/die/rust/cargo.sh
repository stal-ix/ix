{% extends '//die/c/ix.sh' %}

{% block task_pool %}full{% endblock %}

{% block rustc_ver %}
80
{% endblock %}

{% block std_env %}
bld/pzd
bld/python
bld/rust/cc
bld/pkg/config
bld/rust/devendor
{% if help %}
bin/cargo/whatfeatures
{% endif %}
{{super()}}
bld/rust(rustc_ver={{self.rustc_ver().strip()}})
{% endblock %}

{% block unpack %}
mkdir src
cd src
des ${src}/*.pzd .
rust_devendor vendored
{% endblock %}

{% block cargo_refine %}
{% endblock %}

{% block cargo_ver %}
v3
{% endblock %}

{% block bld_data %}
aux/cargo/{{self.cargo_ver().strip()}}(url={{self.cargo_url().strip()}},sha={{self.cargo_sha().strip()}},parent_id={{self.cargo_sha().strip()}},refine={{self.cargo_refine().strip() | b64e}})
{% endblock %}

{% block host_libs %}
lib/shim/fake(lib_name=gcc_s)
{% endblock %}

{% block setup_host_flags %}
export LDFLAGS="-L${LD_LIBRARY_PATH} ${LDFLAGS}"
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export CARGO_BUILD_JOBS=16
export CARGO_INSTALL_ROOT=${out}
export CARGO_TARGET_DIR=${tmp}
export CARGO_HOME=${PWD}/.cargo
export OPENSSL_NO_VENDOR=yes
{% endblock %}

{% block setup_tools %}
export TARGET_CC=$(which cc)

cat << EOF > cc
#!/usr/bin/env sh
export target_cc="${TARGET_CC}"
export host_cc="${HOST_CC}"
exec rustcc "\${@}"
EOF

cp cc c++

chmod +x cc c++
{% endblock %}

{% block cargo_features %}
default
{% endblock %}

{% block cargo_packages %}
{% endblock %}

{% block cargo_options %}
build
--offline
--profile {{self.cargo_profile().strip()}}
{% for x in ix.parse_list(self.cargo_packages()) %}
--package {{x}}
{% endfor %}
{% if bin %}
--bins
{% endif %}
{% if lib %}
--lib
{% endif %}
{% if self.cargo_features().strip() == 'default' %}
{% else %}
--no-default-features
{% endif %}
{% endblock %}

{% block configure %}
cat Cargo.toml | cargo_strip_profile > _
mv _ Cargo.toml

cat << EOF >> Cargo.toml
[profile.release]
opt-level = 2
split-debuginfo = 'off'
EOF
{% endblock %}

{% block cargo_profile %}
release
{% endblock %}

{% block build %}
{% if help %}
cargo whatfeatures --offline .
exit 1
{% endif %}
export CC=$(command -v cc)
export CXX=$(command -v c++)
export HOST_CC=${CC}
export HOST_CXX=${CXX}
export TARGET_CC=${CC}
export TARGET_CXX=${CXX}
cargo {{ix.fix_list(self.cargo_options().strip())}}
{% endblock %}
