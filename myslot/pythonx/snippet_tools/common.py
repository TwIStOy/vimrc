def expand_anon(snip):
  anon = []
  for i in range(snip.snippet_start[0], snip.snippet_end[0] + 1):
    anon.append(snip.buffer[i])
  print(anon)
  snip.buffer[snip.snippet_start[0]:snip.snippet_end[0] + 1] = ['']
  snip.expand_anon('\n'.join(anon))


# vim: et sw=2 ts=2
