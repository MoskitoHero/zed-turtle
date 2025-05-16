; Prefix declarations (both standard and SPARQL style)
[
  (prefix_id
    ("@prefix") @context (namespace) @name)
  (sparql_prefix
    ("PREFIX") @context (namespace) @name)
] @item

; Base declarations (both standard and SPARQL style)
[
  (base) @name
  (sparql_base) @name
] @item

; Subjects in triple statements
(triple
  (subject) @name) @item

; Named graphs
(graph
  label: (_) @name) @item
