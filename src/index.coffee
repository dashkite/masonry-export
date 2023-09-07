Presets =

  node: ({ input }) -> "module.exports = #{ input }"

  browser: ({ input }) -> "export default #{ input }"

modularize = ( context ) ->
  do ({ build } = context ) ->
    if build.preset == "js"
      if ( preset = Presets[ build.target ])
        preset context
      else
        throw "unknown preset '#{ build.target }'"
    else context.input

export { modularize }
export default modularize