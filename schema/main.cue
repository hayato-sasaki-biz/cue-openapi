package schema

#_version: =~#"^(\d+\.)?(\d+\.)?(\d+)$"#

#OpenApi: {
	openapi: #_version
	info: {
		title:   string
		version: #_version
	}
	servers: [...{
		// TODO: regexに変更
		url:         string
		description: string
	}]
	tags: [...{
		name: string
	}]
	paths: [string]: #Path
	components: schemas: [string]: #Component
}

#TagName: string
#Path: [#Method]: {
	tags: [...#TagName]
	parameters?: [...{
		name:         string
		in:           "path" | "query" | "header" | "cookie"
		description?: string
		required:     bool | *true
		schema: type: #Type
	}]
	responses: {
		[#Status]: {
			description: string
			content: [#MimeType]: schema: $ref: =~##"^#/components/schemas/.+$"##
		}
	}
	...
}
#Method:   "get" | "post" | "put" | "option"
#Status:   =~#"^[2-5]\d{2}$"#
#MimeType: string

#Type: "string" | "number" | "integer" | "boolean" | "array" | "object"
#Component: {
	type: #Type
	required?: [...or([ for field, v in properties {field}])]
	properties: [string]: {
		type:         #Type
		description?: string
		...
	}
}
