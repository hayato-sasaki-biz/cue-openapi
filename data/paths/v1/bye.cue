package paths

import "strings"

let name = "bye"
let tag = name
let uri = "/v1/\(name)"
let dto = "#/components/schemas/\(strings.ToTitle(name))DTO"

Paths: (uri): [string]: tags: [tag]

Paths: (uri): get: responses: "200": {
	description: "get \(name) message"
	content: "application/json": schema: $ref: dto
}
