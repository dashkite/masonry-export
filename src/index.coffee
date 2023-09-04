Presets =

  node: ({ input }) -> "module.exports = #{ json }"

  browser: ({ input }) -> "export default #{input}"

wrap = ( context ) ->
  do ({ build } = context ) ->
    if build.preset == "js"
      if ( preset = Presets[ build.target ]) ->
        preset context
      else
        throw "unknown preset '#{ build.target }'"
    else context.input

export { wrap }
export defaul wrap