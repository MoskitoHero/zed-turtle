; Prefixes and directives
(prefix_id) @keyword
(sparql_prefix) @keyword
(base) @keyword
(sparql_base) @keyword

; Namespaces and prefixes
(namespace) @namespace
(pn_prefix) @namespace
(pn_local) @property

; Prefixed names
(prefixed_name) @variable

; URIs/IRIs
(iri_reference) @string.special.url

; Comments
(comment) @comment

; Literals
(string) @string
(rdf_literal
  value: (string) @string
  datatype: (_) @type.builtin)
(integer) @number
(decimal) @number
(double) @number
(boolean_literal) @constant.builtin

; Language Tags
(lang_tag) @attribute

; Punctuation
"." @punctuation.delimiter
"," @punctuation.delimiter
";" @punctuation.delimiter
"[" @punctuation.bracket
"]" @punctuation.bracket
"(" @punctuation.bracket
")" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"^^" @operator

; Keywords and special syntax
"a" @keyword.operator
"@prefix" @keyword
"@base" @keyword
"PREFIX" @keyword
"BASE" @keyword
"GRAPH" @keyword

; Blank nodes
(blank_node_label) @variable.special
(anon) @variable.special

; Predicates and objects
(predicate) @function
(subject) @variable
(object_list) @parameter
