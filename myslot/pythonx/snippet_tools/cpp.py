#####################
#  Postfix Section  #
#####################

_POSTFIX_TEMPLATES = {
    'for-loop': ['for (auto&& item : {0}) {{',
                 '  ${{0:/* body */}}',
                 '}}'],
    'for-i-loop': ['for (auto i = 0u; i < {0}; ++i) {{',
                   '  ${{0:/* body */}}',
                   '}}'],
    'if': ['if ({0}) {{',
          '  ${{0:/* body */}}',
          '}}'],
    'begin-end': ['std::begin({0}), std::end({0})'],
    'std::move': ['std::move({0})'],
    'return': ['return {0};'],
}


def expand_by_postfix_template(key, snip, *args):
  tpl = _POSTFIX_TEMPLATES[key]
  first_line = True
  for line in tpl:
    if first_line:
      snip.rv = line.format(*args)
      first_line = False
    else:
      snip += line.format(*args)
  return snip.rv

# vim: et sw=2 ts=2
