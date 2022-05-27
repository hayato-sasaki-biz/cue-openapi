package paths

import (
	"com.example.app/schema/policy:schema"
	c "com.example.app/data/components"
)

Paths: schema.#OpenApi.paths

// path内で指定するコンポーネントの整合性を確認
Paths: [string]: [schema.#Method]: responses: [schema.#Status]: content: [schema.#MimeType]: schema: $ref: #ComponentName
#ComponentName: or([for componentName, _ in c.ComponentSchemas {"#/components/schemas/\(componentName)"}])
