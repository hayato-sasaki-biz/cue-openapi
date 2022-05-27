package schema

// 一旦jsonしか使わないpolicyだと仮定
#MimeType: "application/json"

// Componentはobjectのみとする
#Component: type: "object"

// OpenAPIのバージョンは3以上
#OpenApi: openapi: =~#"^3\.(\d+\.)?(\d+)$"#

// pathに対してつけられるタグは1個のみ
#Path: [#Method]: tags: [string]

// URIは/v1/で始まるように制限
#OpenApi: paths: [#URI]: null
#URI: !~#"^/v1/.+$"#
