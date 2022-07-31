import json

import core.utils as cu


UID = '#uid_placeholder#'


def gen_udir(suffix):
    return UID + '-' + cu.canon_name(suffix)


def replace_dict(d, f, t):
    return json.loads(json.dumps(d).replace(f, t))


def replace_sentinel(x):
    if 'uid' not in x:
        x = cu.dict_dict_update(x, {'uid': UID})

    rep = x.get('predict', x)
    uid = cu.struct_hash(replace_dict(rep, UID, ''))

    return replace_dict(x, UID, uid)
