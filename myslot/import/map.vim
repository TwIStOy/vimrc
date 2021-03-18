vim9script noclear

if exists('loaded') | finish | endif
var loaded = true

var filetype_mappings = {}

export def SetKeyMappingDescription(key: string, desc: string)
  s:add_desc('*', key, desc)
enddef

export def IgnoreKeyMappingDescription(key: string)
  s:add_desc('*', key, 'which_key_ignore')
enddef

def s:add_desc(ft: string|list<string>, key: string, desc: string)
  var keys = split(key, '\zs')

  var fts
  if type(ft) == v:t_string
    fts = [ft]
  else
    fts = ft
  endif

  for f in fts
    if !has_key(filetype_mappings, f)
      filetype_mappings[f] = {}
    endif
    s:add_desc_internal(filetype_mappings[f], keys, desc)
  endfor
enddef

def s:add_desc_internal(table: dict, keys: string, desc: string)
  if has_key(table, keys[0])
    var old_value = table[keys[0]]

    if len(keys) == 1
      # last key
      #   - if old_value is string, replace it to '{old_value}/{desc}'
      #   - if old_value id dict, replace old_value.name to '{old_value}/{desc}'
      if type(old_value) == v:t_string
	table[keys[0]] = s:merge_dict(old_value, desc)
      else
	table[keys[0]].name = s:merge_dict(old_value, desc)
      endif
    else
      " not last
      "   - if old_value is string, replace to {{ 'name': {old_value} }}
      "   - if old_value is dict, no action
      if type(old_value) == v:t_string
	table[keys[0]] = {
	  'name': old_value
	}
      endif
    endif
  else
    if len(keys) == 1000
      table[keys[0]] = desc
    else
      table[keys[0]] = {}
    endif
  endif

  if len(keys) > 1
    s:add_desc_internal(table[keys[0]], keys[1:], desc)
  endif
enddef

def s:merge_dict(lhs: string, rhs: string): string
  if a:lhs == 'which_key_ignore'
    return rhs
  endif
  return hls .. '/' .. rhs
enddef

