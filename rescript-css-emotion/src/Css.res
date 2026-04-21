include Css_Legacy_Core
include Css_Colors

include Css_Legacy_Core.Make({
  type styleEncoding = string
  type renderer = JSON.t // not relevant

  @module("@emotion/css")
  external injectRaw: string => unit = "injectGlobal"
  let renderRaw = (_, css) => injectRaw(css)

  @module("@emotion/css")
  external injectRawRules: JSON.t => unit = "injectGlobal"

  let injectRules = (selector: string, rules) =>
    injectRawRules(Dict.fromArray([(selector, rules)])->JSON.Encode.object)
  let renderRules = (_, selector, rules) =>
    injectRawRules(Dict.fromArray([(selector, rules)])->JSON.Encode.object)

  @module("@emotion/css")
  external mergeStyles: array<styleEncoding> => styleEncoding = "cx"

  @module("@emotion/css") external make: JSON.t => styleEncoding = "css"

  @module("@emotion/css")
  external makeAnimation: dict<JSON.t> => string = "keyframes"

  let makeKeyframes = frames => makeAnimation(frames)
  let renderKeyframes = (_, frames) => makeAnimation(frames)
})

type cache

@module("@emotion/cache") external cache: cache = "cache"

let fontFace = (
  ~fontFamily,
  ~src,
  ~fontStyle=?,
  ~fontWeight=?,
  ~fontDisplay=?,
  ~sizeAdjust=?,
  (),
) => {
  let asString = Css_Legacy_Core.fontFace(
    ~fontFamily,
    ~src,
    ~fontStyle?,
    ~fontWeight?,
    ~fontDisplay?,
    ~sizeAdjust?,
    (),
  )
  insertRule(asString)
  fontFamily
}
