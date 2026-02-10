;; extends

(call
  function: (attribute
    attribute: (identifier) @id (#match? @id "execute"))
  arguments: (argument_list
    (string
      (string_content) @injection.content
      (#set! injection.language "sql"))))
