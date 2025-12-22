{% extends '//die/c/ix.sh' %}

{% block task_pool %}full{% endblock %}

{% block rust_tool %}
{{self.cargo_tool().strip().replace('/cargo/', '/rust/')}}
{% endblock %}

{% block std_env %}
bld/pzd/des
bld/pkg/config
bld/rust/helpers
{% if help %}
bin/cargo/whatfeatures
{% endif %}
{{super()}}
{{self.cargo_tool()}}
{{self.rust_tool()}}
{% endblock %}

{% block unpack %}
mkdir src
cd src
des ${src}/*.pzd .
rust_devendor vendored
{% endblock %}

{% block cargo_refine %}
{% endblock %}

{% block cargo_refine_tools %}
{% endblock %}

{% block cargo_ver %}
v3
{% endblock %}

{% block cargo_fetch_sha %}
__skip__
{% endblock %}

{% block cargo_args %}
url={{self.cargo_url().strip()}}
sha={{self.cargo_sha().strip()}}
parent_id={{self.cargo_sha().strip()}}
refine={{self.cargo_refine().strip() | b64e}}
refine_tools={{self.cargo_refine_tools().strip() | b64e}}
cargo_tool={{self.cargo_tool().strip()}}
fetch_sha={{self.cargo_fetch_sha().strip()}}
{% endblock %}

{% block bld_data %}
aux/cargo/{{self.cargo_ver().strip()}}({{self.cargo_args().strip().replace('\n', ',')}})
{% endblock %}

{% block host_libs %}
lib/shim/fake(lib_name=gcc_s)
{% endblock %}

{% block setup_host_flags %}
export LDFLAGS="-L$(echo ${LD_LIBRARY_PATH} | sed -e 's|:| -L|') -lc ${LDFLAGS}"
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
__default__
{% endblock %}

{% block cargo_packages %}
{% endblock %}

{% block cargo_flags %}
build

--offline
--target {{target.rust}}
--profile {{self.cargo_profile().strip()}}

{% if bin %}
  --bins
{% endif %}

{% if lib %}
  --lib
{% endif %}

{% if '__default__' in self.cargo_features() %}
{% else %}
  --no-default-features
{% endif %}

{% for x in self.cargo_features() | parse_list %}
  {% if x != '__default__' %}
    --features {{x}}
  {% endif %}
{% endfor %}
{% endblock %}

{% block configure %}
cat Cargo.toml \
    | t2j \
    | jstrip profile \
    | j2t \
    > _

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
export RUSTC_BOOTSTRAP=1
{% if self.cargo_packages().strip() %}
{% for x in self.cargo_packages() | parse_list %}
cargo {{self.cargo_flags().strip() | fix_list}} --package {{x}}
{% endfor %}
{% else %}
cargo {{self.cargo_flags().strip() | fix_list}}
{% endif %}
ln -s ${tmp}/{{target.rust}}/{{self.cargo_profile().strip()}} ${tmp}/out
{% endblock %}

{% block cargo_bins %}
{% endblock %}

{% block install %}
{% if bin %}
mkdir ${out}/bin
{% for x in self.cargo_bins() | parse_list %}
cp ${tmp}/out/{{x}}{{target.exe_suffix}} ${out}/bin/
{% endfor %}
{% endif %}
{% endblock %}
