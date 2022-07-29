import json

import core.utils as cu


UID = '#uid_placeholder#'


def gen_udir(suffix):
    return UID + '-' + cu.canon_name(suffix)


def replace_dict(d, f, t):
    if 'uid' not in d:
        d = cu.dict_dict_update(d, {'uid': UID})

    return json.loads(json.dumps(d).replace(f, t))


def replace_sentinel(x):
    imp = x.get('important', x)
    uid = cu.struct_hash(replace_dict(imp, UID, ''))

    return replace_dict(x, UID, uid)
