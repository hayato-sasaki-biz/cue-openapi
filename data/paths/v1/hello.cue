package paths

import "strings"

let tag = "hello"
let baseUri = "/v1/\(tag)"
let dto = "#/components/schemas/\(strings.ToTitle(tag))DTO"

Paths: "\(baseUri)/{id}": [string]: tags: [tag]
Paths: "\(baseUri)/{id}": get: {
	parameters: [{
		name: "id"
		in:   "path"
		schema: type: "integer"
	}]
	responses: "200": {
		description: "get \(tag) message"
		content: "application/json": schema: $ref: dto
	}
}
