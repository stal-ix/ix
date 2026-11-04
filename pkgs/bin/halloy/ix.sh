{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
halloy
{% endblock %}

{% block version %}
2026.9
{% endblock %}

{% block cargo_url %}
https://github.com/squidowl/halloy/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
a709be93a981f19face683eccb4148be999bd14db9c8b3b796a05017e6e181e4
{% endblock %}

{% block bld_libs %}
lib/z
lib/xz
lib/zstd
lib/alsa
lib/opengl
lib/openssl
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
lib/shim/fake(lib_name=dl)
lib/shim/fake(lib_name=xcb)
lib/shim/fake/symbol(symbol_name=xcb_connect)
lib/shim/fake/symbol(symbol_name=xcb_disconnect)
lib/shim/fake/symbol(symbol_name=xcb_connection_has_error)
lib/shim/fake/symbol(symbol_name=xcb_get_extension_data)
lib/shim/fake/symbol(symbol_name=xcb_get_setup)
lib/shim/fake/symbol(symbol_name=xcb_prefetch_extension_data)
lib/shim/fake/symbol(symbol_name=xcb_send_request64)
lib/shim/fake/symbol(symbol_name=xcb_wait_for_reply64)
{% endblock %}

{% block patch %}
sed -i '/dependencies.xcb]/,/^$/d' vendored/display-info/Cargo.toml
sed -i \
    -e '/use xcb::XidNew;/d' \
    -e 's/xcb::randr::Output::new(info.id)/info.id/' \
    vendored/display-info/src/linux/wayland.rs
python3 - << EOF
p = 'vendored/display-info/src/error.rs'
s = open(p).read()
s = s.replace('    #[error(transparent)]\n    XcbError(#[from] xcb::Error),\n', '')
s = s.replace('    #[error(transparent)]\n    XcbConnError(#[from] xcb::ConnError),\n', '')
open(p, 'w').write(s)
EOF
cat > vendored/display-info/src/linux/mod.rs << EOF
use crate::{DisplayInfo, error::DIResult};

pub type ScreenRawHandle = u32;

mod wayland;

impl DisplayInfo {
    pub fn all() -> DIResult<Vec<DisplayInfo>> {
        wayland::get_all()
    }

    pub fn from_point(x: i32, y: i32) -> DIResult<DisplayInfo> {
        wayland::get_from_point(x, y)
    }
}
EOF
{% endblock %}

{% block cargo_bins %}
halloy
{% endblock %}

{% block cargo_tool %}
bld/rust/96
{% endblock %}
