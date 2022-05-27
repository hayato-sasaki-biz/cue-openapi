package main

import (
	"com.example.app/schema/policy:schema"
	c "com.example.app/data/components"
	p "com.example.app/data/paths/v1:paths"
)

schema.#OpenApi & {
	openapi: "3.0.0"
	info: {
		title:   "app"
		version: "0.0.1"
	}
	servers: [{
		url:         "http://localhost:8080"
		description: "spring boot micro service tutorial"
	}]
	components: schemas: c.ComponentSchemas
	paths: p.Paths
	tags: [ for t in _tagNamesMap {name: t}]

	// pathsについたタグからタグリストを生成
	_tagNamesWithDuplicates: [ for uri, path in paths for method, v in path {v.tags[0]}]
	_tagNamesMap: {for e in _tagNamesWithDuplicates {(e): e}}
}
