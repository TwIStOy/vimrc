vim9script noclear

g:axring_rings = [
  ['&&', '||'],
  ['>>', '<<'],
  ['==', '!='],
  ['++', '--'],
  ['true', 'false']
]

g:axring_rings_python = [
  ['True', 'False']
]

g:axring_rings_cpp = [
  ['uint8_t', 'uint16_t', 'uint32_t', 'uint64_t'],
  ['htonl', 'ntohl'],
  ['htons', 'ntohs']
]

g:axring_rings_cmake = [
  ['OFF', 'ON'],
  ['YES', 'NO']
]

# vim: et ts=2 sw=2

