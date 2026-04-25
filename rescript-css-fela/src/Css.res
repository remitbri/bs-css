include Css_Js_Core
include Css_Colors

type renderer

include Css_Js_Core.Make({
  type styleEncoding = JSON.t
  type renderer = renderer
  exception NotImplemented

  @send
  external renderStaticString: (renderer, string) => unit = "renderStatic"

  let injectRaw = _css => throw(NotImplemented)
  let renderRaw = (renderer, css) => renderStaticString(renderer, css)

  @send
  external renderStatic: (renderer, JSON.t, string) => unit = "renderStatic"

  let injectRules = (_selector, _rules) => throw(NotImplemented)
  let renderRules = (renderer, selector, rules: JSON.t) => renderStatic(renderer, rules, selector)
  let make = rules => rules

  @module("fela")
  external // no transformation

  mergeStyles: array<styleEncoding> => styleEncoding = "combineRules"

  @send
  external felaRenderKeyframes: (renderer, 'a => dict<JSON.t>, JSON.t) => string = "renderKeyframe"

  let makeKeyframes = _ => throw(NotImplemented)

  let renderKeyframes = (renderer, frames) =>
    renderer->felaRenderKeyframes(_props => frames, JSON.Encode.object(Dict.make()))
})

@module("fela")
external createRenderer: unit => renderer = "createRenderer"
